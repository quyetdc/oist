class UserKeywordSearch < ActiveRecord::Base
  belongs_to :keyword_search
  belongs_to :user

  after_create :update_number_key_search

  private

  def update_number_key_search
    self.update_attributes(number: 1)
  end
end
