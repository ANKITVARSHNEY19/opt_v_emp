module ArticlesHelper
  include Pagy::Frontend


  def article_status(article)
  	return (article.published_at.nil? || article.published_at > Time.now) ? "draft" : "published"
  end

  def article_published(article)
  	article.published_at.strftime("%Y-%m-%d")
  end

  def recent_authors(articles)
	articles.collect {|article| article.author.name }.uniq.join(", ")
  end
end
