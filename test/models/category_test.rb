require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

test "category should be valid" do
@category = Category.new(name: "sports")
assert @category.valid?
end
test "name should not be too long" do
@category.name = "a"* 26
assert_not @category.valid?
end
end