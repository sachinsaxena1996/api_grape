require 'rails_helper'

RSpec.describe Tenant, type: :model do
  context 'Methods' do
    describe '.total_requests' do
      it 'returns total number of users' do
        user = create(:user)
        create(:tenant, user_id: user.id)
        expect(Tenant.total_requests).to eq 0
      end
    end
  end
end
