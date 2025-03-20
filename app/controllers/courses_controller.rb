class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authorize_teacher, except: [:index, :show]

  # GET /courses or /courses.json
  def index
    case current_user_role
    when :dean
      @courses = Course.all
    when :teacher
      @courses = Course.where(teacher: current_person)
    when :student
      @courses = Course.joins(:classroom).where(classrooms: { id: current_person.classroom_id })
    end
  end

  # GET /courses/1 or /courses/1.json
  def show
    authorize_access
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :classroom_id, :teacher_id)
    end

    def authorize_access
      case current_user_role
      when :dean
        # Dean can access all courses
      when :teacher
        unless @course.teacher == current_person
          flash[:alert] = "You are not authorized to view this course."
          redirect_to courses_path
        end
      when :student
        unless @course.classroom == current_person.classroom
          flash[:alert] = "You are not authorized to view this course."
          redirect_to courses_path
        end
      end
    end
end
