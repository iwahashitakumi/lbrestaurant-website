class Public::NewsController < Public::ApplicationController
  def index
    @news = News.all
  end
end
