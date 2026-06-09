class Todo < ApplicationRecord
  def due_today?
    due_date == Date.today
  end
end
