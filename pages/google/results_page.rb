class ResultsPage
  include PageObject

  @@results_id = 'rcnt'

  def results
    @browser.div(id: 'rcnt').wait_until_present
    @browser.div(id: 'rcnt').text
  end
end