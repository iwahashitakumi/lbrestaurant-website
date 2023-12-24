class Public::NewsController < Public::ApplicationController
  def index
    @news = News.with_status(:published).page(params[:page]).per(4)
  end

  def show
    @news = News.with_status(:published).find(params[:id])
  end
end
