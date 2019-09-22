class Article < ApplicationRecord
  belongs_to :author, class_name: User.name

  scope :desc_articles, ->{order("updated_at desc")}
  scope :latest_articles, ->{where("created_at >= ?", Time.now - 7.days)}
  scope :search_with_title, ->(title){where("title like ?", "%#{title}%")}
  scope :auther_articles, ->(author_id){where(author_id: author_id)}
  scope :published_articles, ->{where("published_at IS NOT NULL AND published_at < ?", Time.now)}
  scope :drafts, ->{where("published_at IS NULL OR published_at >= ?", Time.now)}
end
