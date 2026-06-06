ENV["RAILS_ENV"] ||= "test"

require_relative "../../config/environment"
require "capybara/cucumber"

Capybara.app = Rails.application

Before do
  Todo.delete_all
end
