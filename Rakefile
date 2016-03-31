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

Cucumber::Rake::Task.new(:rerun) do |task|
  unless File.zero?('rerun.txt')
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

Cucumber::Rake::Task.new(:all) do |task|
  selenium_successful = run_rake_task("all_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

Cucumber::Rake::Task.new(:all_rerun) do |task|
  task.cucumber_opts = ["--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "-f rerun --out rerun.txt",
                        "--format pretty --color",
                        "features"]
end

Cucumber::Rake::Task.new(:all_no_rerun) do |task|
  task.cucumber_opts = ["--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "--format pretty --color",
                        "features"]
end

Cucumber::Rake::Task.new(:tag_no_rerun) do |task|
  task.cucumber_opts = ["-r features",
                        "-t @#{ENV['TAG'] || "all"}",
                        "--format junit --out junit",
                        "--format html  --out cucumber.html",
                        "--format json  --out cucumber.json",
                        "-f rerun --out rerun.txt",
                        "--format pretty --color"]
end

task :tag do
  selenium_successful = run_rake_task("tag_no_rerun")
  rerun_successful = true
  unless selenium_successful
    puts "\n\n Rerunning failed tests"
    rerun_successful = run_rake_task("rerun")
  end
  unless selenium_successful || rerun_successful
    fail 'Cucumber tests failed'
  end
end

task :default => :all