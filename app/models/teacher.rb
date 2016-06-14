# models a teacher teaching a class
class Teacher < ApplicationRecord
  has_many :school_classes, dependent: :nullify, inverse_of: :teacher

  validates :email, format: { with: /\A.+@.+\z/ }, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :name, length: { maximum: 255 }, presence: true
end
