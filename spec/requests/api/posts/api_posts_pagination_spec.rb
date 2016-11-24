require 'rails_helper'

# test scope is @user is owner of the board and owner of the post/s
RSpec.describe "Api::Board::Posts", type: :request do

  before(:each) do
    user_has_shared_board_scenario
    user_has_many_posts
  end

  let(:num_per_page) {
    20
  }



  describe "Get Posts" do
    it "return posts" do
      get api_board_posts_path(@board), headers: auth_headers(@user), params: {page: 1}
      expect(response).to have_http_status(:ok)
      expect(body_to_json.count).to eq num_per_page
      expect(body_to_json('0')).to match_json_schema(:post)
      expect(get_header("Total").to_i).to eq @num_posts
    end
  end

end