class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[ show edit update destroy ]
  before_action :authorize_admin, except: [:index, :show]

  # GET /classrooms or /classrooms.json
  def index
    @classrooms = Classroom.all.includes(:room, :master)
  end

  # GET /classrooms/1 or /classrooms/1.json
  def show
    # Find students with this classroom (workaround until migration is run)
    @students = Student.where(id: @classroom.students.pluck(:id)) rescue []
    @courses = @classroom.courses.includes(:teacher, :subject)
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    @teachers = Teacher.all
    @rooms = Room.all
  end

  # GET /classrooms/1/edit
  def edit
    @teachers = Teacher.all
    @rooms = Room.all
  end

  # POST /classrooms or /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: "Classroom was successfully created." }
        format.json { render :show, status: :created, location: @classroom }
      else
        @teachers = Teacher.all
        @rooms = Room.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1 or /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: "Classroom was successfully updated." }
        format.json { render :show, status: :ok, location: @classroom }
      else
        @teachers = Teacher.all
        @rooms = Room.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1 or /classrooms/1.json
  def destroy
    @classroom.destroy!

    respond_to do |format|
      format.html { redirect_to classrooms_path, status: :see_other, notice: "Classroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classroom_params
      params.require(:classroom).permit(:name, :room_id, :master_id)
    end
end
