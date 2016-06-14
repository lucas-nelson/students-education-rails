require 'rails_helper'

RSpec.describe 'Students', type: :request do
  # show
  describe 'GET /students/:1.json' do
    let(:student) { FactoryGirl.create(:student, email: 'student_one@example.com', name: 'Student One') }
    let(:student_with_progress) do
      FactoryGirl.create(:student,
                         :with_lesson_parts,
                         email: 'student_one@example.com',
                         name: 'Student One')
    end

    it 'returns a JSON representation of a student with no progress' do
      get student_path(student, format: :json)

      expect(response).to have_http_status(:success)

      body = JSON.parse(response.body)
      student_attr = body.fetch('student')
      progress_attr = body.fetch('progress')

      expect(student_attr.fetch('email')).to eq 'student_one@example.com'
      expect(student_attr.fetch('id')).to eq student.id
      expect(student_attr.fetch('name')).to eq 'Student One'
      expect(student_attr.fetch('school_class_id')).to eq student.school_class_id

      expect(progress_attr).to be_empty
    end

    it 'returns a JSON representation of a student with progress' do
      get student_path(student_with_progress, format: :json)

      expect(response).to have_http_status(:success)

      body = JSON.parse(response.body)
      progress_attr = body.fetch('progress')

      expect(progress_attr.fetch('lesson')).to eq 2
      expect(progress_attr.fetch('part')).to eq 3
    end
  end
end
