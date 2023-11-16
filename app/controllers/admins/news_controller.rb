class Admins::NewsController < Admins::ApplicationController
  def index
    @q = News.ransack(params[:q])
    @news = @q.result(distinct: true).page(params[:page])
    @search_scope = :title_or_body_cont
    session[:news_index_url] = request.url
  end

  def new
    @news = News.new
    @news_index_url = session[:news_index_url]
  end
  
  def create
    @news = News.new(news_params)
    @news_index_url = session[:news_index_url]
    begin
      @news.save!
      redirect_to @news_index_url, notice: "お知らせの投稿ができました"
    rescue
      render "new", alert: "お知らせの投稿ができませんでした"
    end
  end
  
  def show
    @news = News.find(params[:id])
    @news_index_url = session[:news_index_url]
  end
  
  def edit
    @news = News.find(params[:id])
    @news_index_url = session[:news_index_url]
  end
  
  def update
    @news = News.find(params[:id])
    @news_index_url = session[:news_index_url]
    begin
      @news.update!(news_params)
      redirect_to @news_index_url, notice: "お知らせの内容を変更できました"
    rescue
      render 'edit', alert: "お知らせの内容を変更できませんでした"
    end
  end
  
  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to @news_index_url|| admins_news_index_path, notice: "お知らせを削除しました"
  end
  

  private
  
  def news_params
    params.require(:news).permit(:calendar_date, :title, :start_at, :end_at, :body)
  end
end
 