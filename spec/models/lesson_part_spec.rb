require 'rails_helper'

RSpec.describe LessonPart, type: :model do
  # need to create a model here that's valid so the validate_uniqueness_of test below will work
  subject { FactoryGirl.create :lesson_part }

  it { should respond_to :completions }
  it { should have_many(:completions).dependent(:destroy).inverse_of(:lesson_part) }

  it { should respond_to :lesson }
  it { should belong_to(:lesson).dependent(false).inverse_of(:lesson_parts).touch(true) }
  it { should validate_presence_of(:lesson).with_message('must exist') }

  it { should respond_to :name }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_presence_of :name }

  it { should respond_to :ordinal }
  it { should validate_numericality_of(:ordinal).only_integer.is_greater_than(0).is_less_than_or_equal_to(3) }
  it { should validate_presence_of :ordinal }
  it { should validate_uniqueness_of(:ordinal).scoped_to(:lesson_id) }

  it { should respond_to :students }
  it { should have_many(:students).through(:completions) }

  describe 'preceding lesson parts' do
    let(:lesson_part) { FactoryGirl.create :lesson_part }

    it 'should be the preceding lesson part in the same lesson' do
      second_lesson_part = FactoryGirl.create :lesson_part, lesson: lesson_part.lesson

      expect(second_lesson_part.preceding).to eq lesson_part
    end

    it 'should be nil when there are no lesson parts' do
      expect(lesson_part.preceding).to be_nil
    end

    it 'should ignore lesson parts from other lessons' do
      lesson_parts_in_other_lessons = FactoryGirl.create :lesson_part

      expect(lesson_parts_in_other_lessons.preceding).to be_nil
    end

    it 'should be from the preceding lesson' do
      first_lesson = FactoryGirl.create(:lesson, ordinal: 1)
      FactoryGirl.create_list(:lesson_part, 3, lesson: first_lesson)

      second_lesson = FactoryGirl.create(:lesson, ordinal: 2, school_class: first_lesson.school_class)
      first_part_second_lesson = FactoryGirl.create(:lesson_part, lesson: second_lesson, ordinal: 1)

      expect(first_part_second_lesson.preceding).to eq first_lesson.lesson_parts.last
    end
  end
end
