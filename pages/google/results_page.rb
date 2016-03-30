class ResultsPage
  include PageObject

  @results_class = 'r'

  def results
    @browser.h3(class: 'r').when_present.text
  end
end