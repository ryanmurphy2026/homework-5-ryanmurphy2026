require "simplecov"
SimpleCov.command_name "RSpec"
SimpleCov.coverage_dir "tmp/coverage"
SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter unless ENV["CI"]
SimpleCov.start "rails" do
  add_filter "/app/jobs/application_job.rb"
  add_filter "/app/mailers/application_mailer.rb"
  add_filter "/vendor/"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
