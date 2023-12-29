class Public::ShopsController < Public::ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(8)
  end
end
