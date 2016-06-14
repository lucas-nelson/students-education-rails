# Handles requests relating to students
class StudentsController < ApplicationController
  before_action :set_student, only: [:destroy, :show, :update]

  def index
    # TODO: would be nice to group them into classes
    @students = Student.order(:name)
  end

  def show
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
