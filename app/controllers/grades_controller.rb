class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]
  before_action :set_student, only: [:index], if: -> { params[:student_id].present? }
  before_action :authorize_teacher, except: [:index, :show]

  # GET /grades or /grades.json
  def index
    if params[:student_id].present?
      @student = Student.find(params[:student_id])
      
      # Check authorization
      case current_user_role
      when :dean
        # Dean can view all grades
        @grades = @student.grades
      when :teacher
        # Teachers can only view grades for students in their courses
        student_course_ids = Course.where(teacher: current_person).pluck(:id)
        @grades = @student.grades.where(course_id: student_course_ids)
        
        if @grades.empty? && !student_course_ids.empty?
          flash[:alert] = "This student is not in any of your courses."
          redirect_to dashboard_path
        end
      when :student
        # Students can only view their own grades
        if current_person.id != @student.id
          flash[:alert] = "You can only view your own grades."
          redirect_to dashboard_path
          return
        end
        @grades = @student.grades
      end
    else
      # Regular index view for all grades
      @grades = Grade.all
    end
  end

  # GET /grades/1 or /grades/1.json
  def show
    authorize_access
  end

  # GET /grades/new
  def new
    @grade = Grade.new
    @grade.course_id = params[:course_id] if params[:course_id].present?
    @grade.student_id = params[:student_id] if params[:student_id].present?
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: "Grade was successfully created." }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: "Grade was successfully updated." }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy!

    respond_to do |format|
      format.html { redirect_to grades_path, status: :see_other, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Set student for nested routes
    def set_student
      @student = Student.find(params[:student_id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:score, :comment, :examination_id, :student_id, :course_id)
    end
    
    def authorize_access
      case current_user_role
      when :dean
        # Dean can access all grades
      when :teacher
        unless @grade.course.teacher == current_person
          flash[:alert] = "You are not authorized to view this grade."
          redirect_to dashboard_path
        end
      when :student
        unless @grade.student == current_person
          flash[:alert] = "You are not authorized to view this grade."
          redirect_to dashboard_path
        end
      end
    end
end
