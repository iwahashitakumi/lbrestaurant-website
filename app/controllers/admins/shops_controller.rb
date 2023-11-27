class Admins::ShopsController < Admins::ApplicationController
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
    @shops_index_url = session[:shops_index_url]
  end

  def new
    @shop = Shop.new
    @prefectures = Prefecture.all
    @shops_index_url = session[:shops_index_url]
  end
  
  def create
    @shop = Shop.new(shop_params)
    @prefectures = Prefecture.all
    @shops_index_url = session[:shops_index_url]
    begin
      @shop.save!
      redirect_to @shops_index_url, notice: "店舗の登録ができました"
    rescue
      flash.now[:alert] = "店舗の登録ができませんでした"
      render "new"
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
    @shops_index_url = session[:shops_index_url]
  end

  def edit
    @shop = Shop.find(params[:id])
    @prefectures = Prefecture.all
    @shops_index_url = session[:shops_index_url]
  end
  
  def update
    @shops = Shops.find(params[:id])
    @prefectures = Prefecture.all
    @shops_index_url = session[:shops_index_url]
    begin
      @shop.update!(shop_params)
      redirect_to @shops_index_url, notice: "店舗の内容を変更できました"
    rescue
      flash.now[:alert] = "店舗の内容を変更できませんでした"
      render 'edit'
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    @shops_index_url = session[:shops_index_url]
    begin
      @shop.discard!
      redirect_to @shops_index_url|| admins_shops_path, notice: "店舗を削除しました"
    rescue
      flash.now[:alert] = "店舗を削除できませんでした"
      render 'index'
    end
  end

  def restore
    @shop = Shop.find(params[:id])
    @shops_index_url = session[:shops_index_url]
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
    params.require(:shop).permit(:name, :address, :access, :business_time, :phone_number, :counter_seats, :table_seats, :site_name, :gourmet_site_link, :city_name, :shop_images, :prefecture_id)
  end
end
