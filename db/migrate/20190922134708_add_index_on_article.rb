class AddIndexOnArticle < ActiveRecord::Migration[5.2]
  def change
  	add_index :articles, [:updated_at, :created_at, :title, :author_id], name: 'custom_index'
  end
end
