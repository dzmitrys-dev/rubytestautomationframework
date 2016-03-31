Given /^I am on Google search page/ do
  on_page SearchPage do |page|
    page.open_page
  end
end

When /^I search for "([^"]*)"$/ do |search_query|
  on_page SearchPage do |page|
    page.search_for search_query
  end
end

Then /"([^\"]*)" is present on the results page/ do |result|
  on_page ResultsPage do |page|
    results = page.results
    results.include?(result).should == true
  end
end