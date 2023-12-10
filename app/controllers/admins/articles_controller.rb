class Admins::ArticlesController < Admins::ApplicationController

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page])
    session[:articles_index_url] = request.url
  end

  def new
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @article = Article.new
    @article.contents.build
  end
  
  def create
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @article = Article.new(article_params)
    begin
      @article.save!
      redirect_to @articles_index_url, notice: "ブログの登録ができました"
    rescue
      flash.now[:alert] = "ブログの登録ができませんでした"
      render "new"
    end
  end

  def show
    @articles_index_url = session[:articles_index_url]
    @article = Article.find(params[:id])
  end
  

  def edit
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @article = Article.find(params[:id])
  end
  
  def update
    @articles_index_url = session[:articles_index_url]
    @start_at_options = start_at_options
    @end_at_options = end_at_options
    @article = Article.find(params[:id])
    begin
      @article.update!(article_params)
      redirect_to @articles_index_url, notice: "ブログの内容を変更できました"
    rescue
      flash.now[:alert] = "ブログの内容を変更できませんでした"
      render 'edit'
    end
  end

  def destroy
    @articles_index_url = session[:articles_index_url]
    @article = Article.find(params[:id])
    begin
      @article.destroy!
      redirect_to @articles_index_url|| admins_articles_path, notice: "ブログを削除しました"
    rescue
      flash.now[:alert] = "ブログを削除できませんでした"
      render 'index'
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :start_at, :end_at, :category, contents_attributes: [:id, :body, :article_image,:article_image_cache, :_destroy])
  end  

  def start_at_options
    {  min: Time.zone.now.strftime("%Y-%m-%dT%H:%M"), max: (Time.zone.now + 1.year), value: Time.zone.now.strftime("%Y-%m-%dT%H:%M") }
  end

  def end_at_options
    { min: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M"), value: (Time.zone.now + 1.day).strftime("%Y-%m-%dT%H:%M") }
  end
end
