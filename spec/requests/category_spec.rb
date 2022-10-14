require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'get categories' do
    before(:example) { get '/categories' }

    it 'it should redirect to user login page' do
      expect(response).to have_http_status(302)
    end
  end
end
