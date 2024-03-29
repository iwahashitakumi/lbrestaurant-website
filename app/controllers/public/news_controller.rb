class Public::NewsController < Public::ApplicationController
  def index
    @active_tab = params[:active_tab]
    @news = News.with_status(:published).page(params[:news_page]).per(5).order(created_at: :desc)
    @articles = Article.with_status(:published).page(params[:blog_page]).per(5).order(created_at: :desc)
  end

  def show
    @news = News.with_status(:published).find(params[:id])
  end

  def article
    @article = Article.with_status(:published).find(params[:id])
  end
end
