ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rspec/rails"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.before(:suite) do
    Todo.delete_all
  end
end
