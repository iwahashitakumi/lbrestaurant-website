class Admins::ShopsController < Admins::ApplicationController
  before_action :set_shops_index_url, only: [:discarded, :new, :create, :show, :edit, :update, :destroy, :restore]
  before_action :set_shops_discarded_url, only: [:show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy, :restore]

  def index
    @q = Shop.kept.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page])
    @search_residence_scope = :prefecture_name_or_city_name_or_address_cont
    session[:shops_index_url] = request.url
  end

  def discarded
    @q = Shop.discarded.ransack(params[:q])
    @discarded_shops = @q.result(distinct: true).page(params[:page])
    @search_residence_scope = :prefecture_name_or_city_name_or_address_cont
    @is_discarded = true
    session[:shops_discarded_url] = request.url
  end

  def new
    @shop = Shop.new
    @prefectures = Prefecture.all
  end
  
  def create
    @shop = Shop.new(shop_params)
    @prefectures = Prefecture.all
    begin
      @shop.save!
      redirect_to @shops_index_url, notice: "店舗の登録ができました"
    rescue
      flash.now[:alert] = "店舗の登録ができませんでした"
      render "new"
    end
  end
  
  def show
    @shops_discarded_url = session[:shops_discarded_url]
    @is_discarded = params[:is_discarded].present?
  end

  def edit
    @prefectures = Prefecture.all
  end
  
  def update
    @prefectures = Prefecture.all
    begin
      @shop.update!(shop_params)
      redirect_to @shops_index_url, notice: "店舗の内容を変更できました"
    rescue
      flash.now[:alert] = "店舗の内容を変更できませんでした"
      render 'edit'
    end
  end
  
  def destroy
    begin
      @shop.discard!
      redirect_to @shops_index_url|| admins_shops_path, notice: "店舗を削除しました"
    rescue
      flash.now[:alert] = "店舗を削除できませんでした"
      render 'index'
    end
  end

  def restore
    begin
      @shop.undiscard!
      redirect_to @shops_index_url, notice: "店舗を元に戻しました"
    rescue
      flash.now[:alert] = "店舗を復活できませんでした"
      render 'discarded'
    end
  end
  

  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :access, :business_time, :phone_number, :counter_seat, :table_seat, :site_name, :gourmet_site_link, :city_name, :shop_image,:shop_image_cache, :prefecture_id)
  end
  
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_shops_index_url
    @shops_index_url = session[:shops_index_url]
  end
  
  def set_shops_discarded_url
    @shops_discarded_url = session[:shops_discarded_url]
  end
end
