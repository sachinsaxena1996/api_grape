require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Methods' do
    describe '.total_users' do
      it 'returns total number of users' do
        create(:user)
        expect(User.total_users).to eq 1
      end
    end
  end
end
