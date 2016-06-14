# models a class in school having a teachers, students and lessons
class SchoolClass < ApplicationRecord
  belongs_to :teacher, inverse_of: :school_classes, touch: true

  has_many :lessons, -> { order(:ordinal) }, inverse_of: :school_class, dependent: :nullify
  has_many :students, inverse_of: :school_class, dependent: :nullify

  validates :name, length: { maximum: 255 }, presence: true
end
