class Admins::AdminUsersController < Admins::ApplicationController
  before_action :assign_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :assign_admin_users_index_url, only: [:new, :create, :show, :edit, :update, :destroy]

  def new
    @admin_user = Admin.new
  end
  
  def create
    @admin_user = Admin.new(admin_user_params)
    begin
      @admin_user.save!
      redirect_to @admin_users_index_url, notice: "#{@admin_user.name}の登録ができました"
    rescue
      flash.now[:alert] = "管理ユーザーの登録ができませんでした"
      render "new"
    end
  end
  
  private
  
  def admin_user_params
    params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
  end

  def assign_admin_user
    @admin_user = Admin.find(params[:id])
  end

  def assign_admin_users_index_url
    @admin_users_index_url = session[:admin_users_index_url]
  end
end

