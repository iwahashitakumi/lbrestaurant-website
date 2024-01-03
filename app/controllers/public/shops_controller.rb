class Public::ShopsController < Public::ApplicationController
  def index
    @shops = Shop.kept.page(params[:page]).per(8)
  end
end
