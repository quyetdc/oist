class CreateKeywordSearches < ActiveRecord::Migration
  def change
    create_table :keyword_searches do |t|
      t.string :keyword

      t.timestamps null: false
    end
  end
end
