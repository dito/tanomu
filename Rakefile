require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "test"]
  t.name = "test"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test
