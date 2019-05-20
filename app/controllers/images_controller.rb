class ImagesController < ApplicationController
  include SearchImage

  def index
    key_search = params[:search] || "flowers"
    @imgs_unsplash = search_image(key_search)
    @imgs_flickr = search_image_flickr(key_search)

    if key_search.present? && current_user.present?
      if current_user.keyword_searchs.where(keyword: key_search).size == 0
        current_user.keyword_searchs << KeywordSearch.find_or_create_by(keyword: key_search)
      else
        keyword_search   = current_user.keyword_searchs.find_by(keyword: key_search).id
        increased_number = UserKeywordSearch.find_by(user_id: current_user, keyword_search_id: keyword_search).number + 1
        UserKeywordSearch.find_by(user_id: current_user, keyword_search_id: keyword_search).update_attributes(number: increased_number)
      end
    end
  end
end
