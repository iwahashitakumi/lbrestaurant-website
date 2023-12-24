class Public::ArticlesController < Public::ApplicationController
  def index
    @articles = Article.with_status(:published).page(params[:page]).per(6)
  end
end
