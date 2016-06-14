require 'rails_helper'

RSpec.describe Completion, type: :model do
  it { should respond_to :lesson_part }
  it { should belong_to(:lesson_part).dependent(false).inverse_of(:completions) }
  it { should validate_presence_of(:lesson_part).with_message('must exist') }

  it { should respond_to :student }
  it { should belong_to(:student).dependent(false).inverse_of(:completions) }
  it { should validate_presence_of(:student).with_message('must exist') }

  describe 'preceding completion' do
    let(:school_class) { FactoryGirl.create :school_class }
    let(:lesson) { FactoryGirl.create :lesson, school_class: school_class }
    let(:student) { FactoryGirl.create :student, school_class: school_class }
    let!(:lesson_part) { FactoryGirl.create :lesson_part, lesson: lesson, ordinal: 1 }

    it 'is valid on first lesson part' do
      completion = FactoryGirl.build :completion, lesson_part: lesson_part, student: student

      expect(completion).to be_valid
    end

    it 'is not valid when skipping a lesson part' do
      second_lesson_part = FactoryGirl.create :lesson_part, ordinal: 2, lesson: lesson
      completion = FactoryGirl.build :completion, lesson_part: second_lesson_part, student: student

      expect(completion).to be_invalid
    end
  end
end
