class SearchController < ApplicationController

  def results
  	@results = GoogleCustomSearchApi.search("Problem")
  end
end
