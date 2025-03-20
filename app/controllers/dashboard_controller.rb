class DashboardController < ApplicationController
  def index
    case current_user_role
    when :dean
      @courses = Course.all
      @teachers = Teacher.all
      @students = Student.all
      @classrooms = Classroom.all
    when :teacher
      @courses = Course.where(teacher: current_person)
      @students = Student.joins(:classroom).where(classrooms: { id: @courses.pluck(:classroom_id) })
    when :student
      @grades = Grade.where(student: current_person)
      @courses = Course.joins(:classroom).where(classrooms: { id: current_person.classroom_id })
    end
  end
end 