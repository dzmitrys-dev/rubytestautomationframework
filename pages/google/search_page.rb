class SearchPage
  include PageObject

  text_field :query, name: 'q'
  button :search, name: 'btnK'

  def open_page
    @browser.goto($BASE_URL)
  end

  def search_for(query_string)
    self.query = query_string
    self.search
  end
end