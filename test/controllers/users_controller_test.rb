require 'test_helper'
class UsersControllerTest < ActionController::TestCase

test "should get users index" do
get :index
assert_response :success
end
test "should get new" do
get :new
assert_response :success
end

end