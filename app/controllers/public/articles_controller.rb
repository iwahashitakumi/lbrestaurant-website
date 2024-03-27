class Public::ArticlesController < Public::ApplicationController
  def show
    @article = Article.with_status(:published).find(params[:id])
  end
end
