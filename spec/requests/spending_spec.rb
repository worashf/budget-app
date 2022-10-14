require 'rails_helper'

RSpec.describe 'Spendings', type: :request do
  describe 'get /spendings list' do
    before(:example) { get '/spendings' }

    it 'it should redirect to user login page' do
      expect(response).to have_http_status(302)
    end
  end
end
