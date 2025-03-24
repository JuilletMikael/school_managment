class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy grades ]
  before_action :authorize_dean_only, only: %i[ new edit update destroy create ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/1/grades
  def grades
    @student = Student.find(params[:id])
    
    # Get all grades for the student with their associated examinations and courses
    @grades = @student.grades.includes(examination: :course)
    
    # Group grades by year (based on effective_date)
    @grades_by_year = @grades.group_by { |grade| grade.effective_date.year }
    
    # Sort years in descending order
    @years = @grades_by_year.keys.sort.reverse
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_path, status: :see_other, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:username, :lastname, :firstname, :email, :phone_number, :address_id, :person_status_id, :type)
    end
    
    # Only dean can edit, update, or delete students
    def authorize_dean_only
      unless current_user_role == :dean
        flash[:alert] = "Only deans can modify or delete students."
        redirect_to students_path
      end
    end
end
