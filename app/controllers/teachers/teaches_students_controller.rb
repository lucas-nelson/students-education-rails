module Teachers
  # Shows a how teachers relate to students
  class TeachesStudentsController < ApplicationController
    before_action :set_teacher

    def index
      @students = Student.taught_by(@teacher)
    end

    private

      def set_teacher
        @teacher = Teacher.find(params[:teacher_id])
      end
  end
end
