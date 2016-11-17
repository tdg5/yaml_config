require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs.concat(%w[test lib])
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
