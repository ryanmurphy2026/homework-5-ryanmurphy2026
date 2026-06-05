require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "category must be one of the allowed options" do
    todo = Todo.new(description: "Plan assignment", category: "errands")

    assert_not todo.valid?
    assert_includes todo.errors[:category], "is not included in the list"
  end
end
