class Admins::ArticlesController < Admins::ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page])
    session[:articles_index_url] = request.url
  end

  def new
    @article = Article.new
    @article.contents.build
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @articles_index_url = session[:articles_index_url]
  end
  
  def create
    @article = Article.new(article_params)
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @articles_index_url = session[:articles_index_url]
    begin
      @article.save!
      redirect_to @articles_index_url, notice: "ブログの登録ができました"
    rescue
      flash.now[:alert] = "ブログの登録ができませんでした"
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
  end
  
  def update
    @article = Article.find(params[:id])  
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    begin
      @article.update!(article_params)
      redirect_to @articles_index_url, notice: "ブログの内容を変更できました"
    rescue
      flash.now[:alert] = "ブログの内容を変更できませんでした"
      render 'edit'
    end
  end

  
  private
  
  def article_params
    params.require(:article).permit(:title, :start_at, :end_at, :category, contents_attributes: [:body, :article_images,:article_images_cache, :_destroy])
  end  

  def start_at_options
    {  min: Time.zone.now.strftime("%Y-%m-%dT%H:%M"), max: (Time.zone.now + 1.year), value: Time.zone.now.strftime("%Y-%m-%dT%H:%M") }
  end

  def end_at_options
    { min: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M"), value: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M") }
  end
end
