require 'rails_helper'
RSpec.describe DashBoardController do
  describe 'GET show' do
    it 'has a 200 status code' do
      get :show
      expect(response.code).to eq('200')
    end
  end
end