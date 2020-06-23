require 'rspec'
require "rails_helper"
require "rails-controller-testing"


RSpec.describe TournamentsController, type: :controller do
    describe 'get index' do 
        it "returns a 200" do
            get :index
            expect(response).to have_http_status(:ok)
        end
    end

end