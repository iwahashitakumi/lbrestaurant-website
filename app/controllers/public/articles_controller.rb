class Public::ArticlesController < Public::ApplicationController
  def index
    @articles = Article.with_status(:published).page(params[:page]).per(6)
  end

  def show
    @article = Article.with_status(:published).find(params[:id])
  end
end
