class Admins::ShopsController < Admins::ApplicationController

  def index
    @q = Shop.kept.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page])
    @search_residence_scope = :prefecture_name_or_city_name_or_address_cont
    session[:shops_index_url] = request.url
  end

  def discarded
    @shops_index_url = session[:shops_index_url]
    @q = Shop.discarded.ransack(params[:q])
    @discarded_shops = @q.result(distinct: true).page(params[:page])
    @search_residence_scope = :prefecture_name_or_city_name_or_address_cont
    @is_discarded = true
    session[:shops_discarded_url] = request.url
  end

  def new
    @shops_index_url = session[:shops_index_url]
    @shop = Shop.new
    @prefectures = Prefecture.all
  end
  
  def create
    @shops_index_url = session[:shops_index_url]
    @shop = Shop.new(shop_params)
    @prefectures = Prefecture.all
    begin
      @shop.save!
      redirect_to index_path_for_redirect, notice: "#{@shop.name}の登録ができました"
    rescue
      flash.now[:alert] = "店舗の登録ができませんでした"
      render "new"
    end
  end
  
  def show
    @shops_index_url = session[:shops_index_url]
    @shops_discarded_url = session[:shops_discarded_url]
    @shop = Shop.find(params[:id])
    @is_discarded = params[:is_discarded].present?
  end

  def edit
    @shops_index_url = session[:shops_index_url]
    @shop = Shop.find(params[:id])
    @prefectures = Prefecture.all
  end
  
  def update
    @shops_index_url = session[:shops_index_url]
    @shop = Shop.find(params[:id])
    @prefectures = Prefecture.all
    begin
      @shop.update!(shop_params)
      redirect_to index_path_for_redirect, notice: "#{@shop.name}の内容を変更できました"
    rescue
      flash.now[:alert] = "#{@shop.name}の内容を変更できませんでした"
      render 'edit'
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    begin
      @shop.discard!
      redirect_to index_path_for_redirect, notice: "#{@shop.name}を削除しました"
    rescue
      flash.now[:alert] = "#{@shop.name}を削除できませんでした"
      render 'index'
    end
  end

  def restore
    @shop = Shop.find(params[:id])
    begin
      @shop.undiscard!
      redirect_to index_path_for_redirect, notice: "#{@shop.name}を復元ました"
    rescue
      flash.now[:alert] = "#{@shop.name}を復元できませんでした"
      render 'discarded'
    end
  end
  

  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :access, :business_time, :phone_number, :counter_seat, :table_seat, :site_name, :gourmet_site_link, :city_name, :shop_image,:shop_image_cache, :prefecture_id)
  end

  def index_path_for_redirect
    session[:shops_index_url] = request.url || admins_shops_path
  end
  
end
