# models a lesson comprising of a number of parts that a student can complete
class Lesson < ApplicationRecord
  belongs_to :school_class, inverse_of: :lessons, touch: true

  has_many :lesson_parts, -> { order(:ordinal) }, dependent: :destroy, inverse_of: :lesson

  validates :name, length: { maximum: 255 }, presence: true
  validates :ordinal, numericality: { greater_than: 0, only_integer: true }, presence: true

  # Gets the preceding Lesson in the same SchoolClass.
  # If this is the first Lesson, returns nil.
  def preceding
    Lesson.find_by(school_class: school_class, ordinal: ordinal - 1)
  end
end
