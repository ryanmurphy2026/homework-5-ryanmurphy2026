require "simplecov"

SimpleCov.coverage_dir "tmp/coverage"
SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter unless ENV["CI"]
SimpleCov.collate Dir["tmp/coverage/.resultset*.json"] do
  load_profile "rails"
  add_filter "/app/jobs/application_job.rb"
  add_filter "/app/mailers/application_mailer.rb"
  add_filter "/vendor/"
  minimum_coverage 80
end
