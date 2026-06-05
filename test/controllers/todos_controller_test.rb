require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { description: @todo.description, category: "home chores" } }
    end

    assert_redirected_to todo_url(Todo.last)
    assert_equal "home chores", Todo.last.category
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { description: @todo.description, category: "personal" } }
    assert_redirected_to todo_url(@todo)
    assert_equal "personal", @todo.reload.category
  end

  test "should filter todos by category" do
    get todos_url(category: "work")

    assert_response :success
    assert_match "Work task", response.body
    assert_no_match "Study task", response.body
  end

  test "should show all todos when category filter is blank" do
    get todos_url(category: "")

    assert_response :success
    assert_match "Work task", response.body
    assert_match "Study task", response.body
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
