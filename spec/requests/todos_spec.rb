require "rails_helper"

RSpec.describe "Todos index filtering", type: :request do
  it "filters todos by category param" do
    Todo.create!(description: "Write report", category: "work")
    Todo.create!(description: "Read chapter", category: "study")

    get todos_path, params: { category: "work" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report")
    expect(response.body).not_to include("Read chapter")
  end

  it "shows all todos when category is blank" do
    Todo.create!(description: "Write report", category: "work")
    Todo.create!(description: "Read chapter", category: "study")

    get todos_path, params: { category: "" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Write report", "Read chapter")
  end
end

RSpec.describe "Todos CRUD", type: :request do
  it "renders new, show, and edit pages" do
    todo = Todo.create!(description: "Write report", category: "work")

    get new_todo_path
    expect(response).to have_http_status(:ok)

    get todo_path(todo)
    expect(response).to have_http_status(:ok)

    get edit_todo_path(todo)
    expect(response).to have_http_status(:ok)
  end

  it "creates a todo" do
    expect do
      post todos_path, params: { todo: { description: "Clean desk", category: "home chores" } }
    end.to change(Todo, :count).by(1)

    expect(response).to redirect_to(todo_path(Todo.last))
    expect(Todo.last.category).to eq("home chores")
  end

  it "renders validation errors for invalid creates" do
    expect do
      post todos_path, params: { todo: { description: "Clean desk", category: "" } }
    end.not_to change(Todo, :count)

    expect(response).to have_http_status(:unprocessable_content)
  end

  it "updates a todo" do
    todo = Todo.create!(description: "Write report", category: "work")

    patch todo_path(todo), params: { todo: { description: "Write report", category: "personal" } }

    expect(response).to redirect_to(todo_path(todo))
    expect(todo.reload.category).to eq("personal")
  end

  it "renders validation errors for invalid updates" do
    todo = Todo.create!(description: "Write report", category: "work")

    patch todo_path(todo), params: { todo: { description: "Write report", category: "errand" } }

    expect(response).to have_http_status(:unprocessable_content)
    expect(todo.reload.category).to eq("work")
  end

  it "destroys a todo" do
    todo = Todo.create!(description: "Write report", category: "work")

    expect do
      delete todo_path(todo)
    end.to change(Todo, :count).by(-1)

    expect(response).to redirect_to(todos_path)
  end

  it "renders hello as html and json" do
    get hello_path
    expect(response).to have_http_status(:ok)

    get hello_path(format: :json)
    expect(response.body).to eq("hello world!")
  end
end
