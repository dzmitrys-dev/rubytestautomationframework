class ResultsPage
  include PageObject

  @@results_id = 'rcnt'

  def results
    @browser.div(id: @@results_id).wait_until_present
    @browser.div(id: @@results_id).text
  end
end