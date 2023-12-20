class Public::NewsController < Public::ApplicationController
  def index
    @news = News.page(params[:page]).per(6)
  end
end
