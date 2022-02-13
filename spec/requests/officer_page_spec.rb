require 'rails_helper'

RSpec.describe "OfficerPages", type: :request do
  describe "GET /officers" do
    it "returns http success" do
      get "/officer_page/officers"
      expect(response).to have_http_status(:success)
    end
  end

end
