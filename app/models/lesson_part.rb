# models a part of a lesson that a student can complete
class LessonPart < ApplicationRecord
  has_many :completions, dependent: :destroy, inverse_of: :lesson_part
  has_many :students, through: :completions

  belongs_to :lesson, inverse_of: :lesson_parts, touch: true

  validates :name, length: { maximum: 255 }, presence: true
  validates :ordinal, numericality: { greater_than: 0, less_than_or_equal_to: 3, only_integer: true }, presence: true
  validates :ordinal, uniqueness: { scope: :lesson_id }

  # Gets the preceding LessonPart in the same Lesson.
  # If this is the first LessonPart, returns nil.
  def preceding
    return LessonPart.find_by(lesson: lesson, ordinal: ordinal - 1) unless ordinal == 1
    # if this LessonPart has an ordinal of 1, then we need the last LessonPart
    # of the prior Lesson
    lesson.preceding&.lesson_parts&.last
  end
end
