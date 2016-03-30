puts 'Loading all pages *_page.rb'
Dir["#{File.dirname(__FILE__)}/**/*_page.rb"].each {|r| load r }
puts 'Complete'