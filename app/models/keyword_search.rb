class KeywordSearch < ActiveRecord::Base
  belongs_to :user
  belongs_to :keyword_search

  class << self
    def check_keyword_user_present user, keyword
      user.keyword_searchs.where(keyword: keyword).size > 0 ? false : true
    end
  end
end
