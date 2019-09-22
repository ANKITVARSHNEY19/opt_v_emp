class ArticlesController < ApplicationController
  include Pagy::Backend

  def index
    @articles = Article.desc_articles
    @articles = @articles.latest_articles
    @articles =@articles.search_with_title(params[:title]) unless params[:title].blank?
    @articles = @articles.auther_articles(author_id: author_id) unless params[:author_id].blank?
    if params[:status] == "published"
      @articles = @articles.published_articles
    elsif params[:status] == "draft"
      @articles = @articles.drafts
    end
    @pagy, @articles = pagy(@articles.includes(:author))
  end
end
