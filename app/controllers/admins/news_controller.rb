class Admins::NewsController < Admins::ApplicationController
  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    begin
      @news.save!
      redirect_to :admins_news_index, notice: "お知らせの投稿ができました"
    rescue
      render "new", alert: "お知らせの投稿ができませんでした"
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    begin
      @news.update!(news_params)
      redirect_to :admins_news_index, notice: "お知らせの内容を変更できました"
    rescue
      render 'edit', alert: "お知らせの内容を変更できませんでした"
    end
  end

  private
  
  def news_params
    params.require(:news).permit(:calendar_date, :title, :start_at, :end_at, :body)
  end
end
 