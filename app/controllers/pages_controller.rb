class PagesController < ApplicationController
  def home
    @most_search_keys = MostSearchKey.new.get_most_keys
  end
end
