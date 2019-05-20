class MostSearchKey
  def get_most_keys
    keyword_search_ids = UserKeywordSearch.order("number desc").map(&:keyword_search_id).uniq.first(5)
    KeywordSearch.where(id: keyword_search_ids).map(&:keyword)

    most_keywords = []
    keyword_search_ids.each do |id|
      most_keywords << KeywordSearch.find(id).keyword
    end
    most_keywords
  end
end
