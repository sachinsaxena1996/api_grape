require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'Methods' do
    describe '.total_answers' do
      it 'returns total number of answers' do
        user = create(:user)
        ques = create(:question, user_id: user.id)
        create(:answer, user_id: user.id, question_id: ques.id)
        expect(Answer.total_answers).to eq 1
      end
    end
  end
end
