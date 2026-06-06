require "cgi"

Given("the following todos exist:") do |table|
  table.hashes.each do |attributes|
    Todo.create!(attributes)
  end
end

When("I visit the todos page") do
  visit "/todos"
end

When("I filter todos by {string}") do |category|
  visit "/todos?category=#{CGI.escape(category)}"
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).to have_no_content(text)
end
