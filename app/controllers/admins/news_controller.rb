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
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end
  
  def create
    @news = News.new(news_params)
    @news_index_url = session[:news_index_url]
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
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
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end
  
  def update
    @news = News.find(params[:id])  
    @news_index_url = session[:news_index_url]
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    begin
      @news.update!(news_params)
      redirect_to @news_index_url, notice: "お知らせの内容を変更できました"
    rescue
      render 'edit', alert: "お知らせの内容を変更できませんでした"
    end
  end
  
  def destroy
    @news = News.find(params[:id])
    @news_index_url = session[:news_index_url]
    begin
      @news.destroy!
      redirect_to @news_index_url|| admins_news_index_path, notice: "お知らせを削除しました"
    rescue
      render 'index', alert: "お知らせの内容を削除できませんでした"
    end
  end
  

  private
  
  def news_params
    params.require(:news).permit(:calendar_date, :title, :start_at, :end_at, :body)
  end

  def calendar_date_options
    { min: (Date.current - 1.year), max: (Date.current + 1.year), value: Date.current }
  end

  def start_at_options
    {  min: Time.current.strftime("%Y/ %m/ %d /%H:%M"), max: (Time.current + 1.year), value: Time.current.strftime("%Y/ %m/ %d /%H:%M") }
  end

  def end_at_options
    { min: (Time.current + 1.day).strftime("%Y-%m-%dT%H:%M"), value: (Time.current + 1.day).strftime("%Y-%m-%dT%H:%M") }
  end
end
