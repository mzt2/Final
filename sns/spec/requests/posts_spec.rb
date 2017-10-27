require 'rails_helper'

RSpec.describe "Api::Posts", type: :request do

  describe "GET /posts" do

    let(:user) { create(:user) }

    before do
      login_user user
    end

    it "gets posts" do
      posts = create_list(:post, 3, user_id: user.id)
      get "/api/posts"
      expect(response).to have_http_status(200)
      puts response.body
      json = JSON.parse(response.body)
      expect(json.size).to     eq posts.count
      expect(json[0]["id"]).to eq posts[0].id
      expect(json[1]["id"]).to eq posts[1].id
    end

  end
end
