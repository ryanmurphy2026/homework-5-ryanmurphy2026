require "rails_helper"

RSpec.describe Todo, type: :model do
  describe ".with_category" do
    it "returns only todos in the selected category" do
      work_todo = Todo.create!(description: "Write report", category: "work")
      Todo.create!(description: "Read chapter", category: "study")

      expect(Todo.with_category("work")).to contain_exactly(work_todo)
    end
  end
end
