class Admins::NewsController < Admins::ApplicationController
  before_action :assign_news, only: [:show, :edit, :update, :destroy]
  before_action :assign_shops_index_url, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :assign_news_time_options, only: [:new, :create, :edit, :update]
 
  def index
    @q = News.ransack(params[:q])
    @news = @q.result(distinct: true).page(params[:page])
    @search_scope = :title_or_body_cont
    session[:news_index_url] = request.url
  end

  def new
    @news = News.new
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end
  
  def create
    @news = News.new(news_params)
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    begin
      @news.save!
      redirect_to @news_index_url, notice: "お知らせの投稿ができました"
    rescue
      flash.now[:alert] = "お知らせの投稿ができませんでした"
      render "new"
    end
  end
  
  def show
  end

  def edit
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end
  
  def update
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    begin
      @news.update!(news_params)
      redirect_to @news_index_url, notice: "お知らせの内容を変更できました"
    rescue
      flash.now[:alert] = "お知らせの内容を変更できませんでした"
      render 'edit'
    end
  end
  
  def destroy
    begin
      @news.destroy!
      redirect_to @news_index_url|| admins_news_index_path, notice: "お知らせを削除しました"
    rescue
      flash.now[:alert] = "お知らせを削除できませんでした"
      render 'index'
    end
  end
  

  private
  def assign_news
    @news = News.find(params[:id])
  end

  def assign_shops_index_url
    @news_index_url = session[:news_index_url]
  end

  def assign_news_time_options
    @calendar_date_options = calendar_date_options
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end

  def news_params
    params.require(:news).permit(:calendar_date, :title, :start_at, :end_at, :body)
  end

  def calendar_date_options
    { min: (Time.zone.today - 1.year), max: (Time.zone.today + 1.year), value: Time.zone.today }
  end

  def start_at_options
    {  min: Time.zone.now.strftime("%Y-%m-%dT%H:%M"), max: (Time.zone.now + 1.year), value: Time.zone.now.strftime("%Y-%m-%dT%H:%M") }
  end

  def end_at_options
    { min: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M"), value: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M") }
  end
end
