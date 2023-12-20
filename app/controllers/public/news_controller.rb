class Public::NewsController < Public::ApplicationController
  def index
    @news = News.page(params[:page]).per(4)
  end

  def show
    @news = News.find(params[:id])
  end
end
