module Students
  # Handles adding and listing the link between a Student and a LessonPart
  # that is: recording a Student completing a LessonPart
  class CompletedLessonPartsController < ApplicationController
    before_action :set_student

    def new
    end

    def create
      add_lesson_part_to @student
      flash['notice'] = t('.notice')
      redirect_back fallback_location: new_student_completed_lesson_part_path
    rescue ActiveRecord::ActiveRecordError => e
      flash['alert'] = e.message
      redirect_back fallback_location: new_student_completed_lesson_part_path
    end

    private

      def add_lesson_part_to(student)
        lesson = Lesson.find_by!(ordinal: params[:lesson_ordinal], school_class: student.school_class)
        lesson_part = LessonPart.find_by!(lesson: lesson, ordinal: params[:lesson_part_ordinal])

        student.lesson_parts << lesson_part
      end

      def set_student
        @student = Student.find(params[:student_id])
      end
  end
end
