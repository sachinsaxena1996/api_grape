require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'Methods' do
    describe '.total_questions' do
      it 'returns total number of questions' do
        user = create(:user)
        create(:question, user_id: user.id)
        expect(Question.total_questions).to eq 1
      end
    end
  end
end
