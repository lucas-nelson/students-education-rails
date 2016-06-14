# Handle requests relating to a teacher
class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]

  def index
    @teachers = Teacher.order(:name)
  end

  def show
  end

  private

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
end
