require 'test_helper'

class SavedLinksControllerTest < ActionController::TestCase
  test "should get update_link" do
    get :update_link
    assert_response :success
  end

end
