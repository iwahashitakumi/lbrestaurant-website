class Public::NewsController < Public::ApplicationController
  def index
    @news = News.published.page(params[:page]).per(4)
  end

  def show
    @news = News.published.find(params[:id])
  end
end
