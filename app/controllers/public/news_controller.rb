class Public::NewsController < Public::ApplicationController
  def index
    @news = News.with_status(:published).page(params[:news_page]).per(5)
    @articles = Article.with_status(:published).page(params[:article_page]).per(5)
  end

  def show
    @news = News.with_status(:published).find(params[:id])
    @article = Article.with_status(:published).find(params[:id])
  end
end
