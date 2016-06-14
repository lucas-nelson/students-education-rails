# models the completion of a LessonPart by a Student
# for now all we need is a timestamp (and the existence of the model)
class Completion < ApplicationRecord
  belongs_to :lesson_part, inverse_of: :completions
  belongs_to :student, inverse_of: :completions

  validate :ensure_completed_preceding, on: :create

  private

    # Adds an error if the student has not completed the preceding LessonPart
    def ensure_completed_preceding
      preceding = lesson_part&.preceding
      return unless preceding
      return if student.lesson_parts.include? preceding

      errors.add(:lesson_part, 'must have completed preceding lesson part')
    end
end
