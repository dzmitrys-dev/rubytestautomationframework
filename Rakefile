require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# Automatic rerun stuff
def run_rake_task(name)
  begin
    Rake::Task[name].execute
  rescue Exception => e
    return false
  end
  true
end

Cucumber::Rake::Task.new(:compile, :tests) do |task, app|
  task.cucumber_opts = ["WEB_DRIVER=none",
                        "-t @compile",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "--format pretty --color",
                        "features"]
end

Cucumber::Rake::Task.new(:all) do |task|
  task.cucumber_opts = ["-t @compile,~@wip",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "--format pretty --color",
                        "features"]
end

Cucumber::Rake::Task.new(:rerun) do |task|
  unless File.exist?('rerun.txt')
    File.open('rerun.txt', 'w+').close
  end
  ENV['FEATURE'] = ''
  task.cucumber_opts = ["@rerun.txt",
                        "-r features",
                        "--format junit --out junit",
                        "--format html  --out cucumber_rerun.html",
                        "--format json  --out cucumber_rerun.json",
                        "--format pretty --color"]
end

task :default => :all