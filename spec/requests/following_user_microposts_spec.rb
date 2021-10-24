require 'rails_helper'

RSpec.describe "FollowingUserMicroposts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/following_user_microposts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
