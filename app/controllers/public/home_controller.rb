class Public::HomeController < Public::ApplicationController
  def show
    load_news
    load_articles
  end

  private

  def load_news
    @latest_news = News.with_status(:published).order(created_at: :desc).first
    @second_latest_news = News.with_status(:published).order(created_at: :desc).second
    @third_latest_news = News.with_status(:published).order(created_at: :desc).third
    @fourth_latest_news = News.with_status(:published).order(created_at: :desc).fourth
    @fifth_latest_news = News.with_status(:published).order(created_at: :desc).fifth
  end

  def load_articles
    @latest_article = Article.with_status(:published).order(created_at: :desc).first
    @second_latest_article = Article.with_status(:published).order(created_at: :desc).second
    @third_latest_article = Article.with_status(:published).order(created_at: :desc).third
    @fourth_latest_article = Article.with_status(:published).order(created_at: :desc).fourth
    @fifth_latest_article = Article.with_status(:published).order(created_at: :desc).fifth
  end
end
