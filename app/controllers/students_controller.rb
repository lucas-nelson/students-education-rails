# Handles requests relating to students
class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  def index
    # TODO: would be nice to group them into classes
    @students = Student.order(:name)
  end

  def show
    respond_to do |format|
      format.html {}
      format.json { render json: hash_for_show_json(@student) }
    end
  end

  private

    def hash_for_progress(lesson_part)
      return {} unless lesson_part

      { lesson: lesson_part.lesson.ordinal, part: lesson_part.ordinal }
    end

    def hash_for_show_json(student)
      last_lesson_part = student.lesson_parts&.last
      progress = hash_for_progress(last_lesson_part)

      { student: @student, progress: progress }
    end

    def set_student
      @student = Student.find(params[:id])
    end
end
