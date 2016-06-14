require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'validations' do
    it { should respond_to :lesson_parts }
    it { should have_many(:lesson_parts).dependent(:destroy).inverse_of(:lesson).order(:ordinal) }

    it { should respond_to :name }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of :name }

    it { should respond_to :ordinal }
    it { should validate_numericality_of(:ordinal).only_integer.is_greater_than(0) }
    it { should validate_presence_of :ordinal }

    it { should respond_to :school_class }
    it { should belong_to(:school_class).dependent(false).inverse_of(:lessons).touch(true) }
    it { should validate_presence_of(:school_class).with_message('must exist') }
  end

  describe 'preceding lessons' do
    let(:lesson) { FactoryGirl.create :lesson }

    it 'should be the preceding lesson in the same school class' do
      second_lesson = FactoryGirl.create :lesson, school_class: lesson.school_class

      expect(second_lesson.preceding).to eq lesson
    end

    it 'should be nil when there are no lessons' do
      expect(lesson.preceding).to be_nil
    end

    it 'should ignore lessons from other classes' do
      lesson_in_other_school_class = FactoryGirl.create :lesson

      expect(lesson_in_other_school_class.preceding).to be_nil
    end
  end
end
