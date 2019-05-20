class CreateUserKeywordSearches < ActiveRecord::Migration
  def change
    create_table :user_keyword_searches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :keyword_search, index: true, foreign_key: true
      t.integer :number

      t.timestamps null: false
    end
  end
end
