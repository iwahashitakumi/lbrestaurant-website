class Admins::AdminUsersController < Admins::ApplicationController
  before_action :assign_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :assign_admin_users_index_url, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    authenticate_role!
    @q = Admin.ransack(params[:q])
    @admin_users = @q.result(distinct: true).page(params[:page])
    session[:admin_users_index_url] = request.url
  end
  
  def new
    authenticate_role!
    @admin_user = Admin.new
  end
  
  def create
    authenticate_role!
    @admin_user = Admin.new(admin_user_params)
    begin
      @admin_user.save!
      redirect_to @admin_users_index_url, notice: "#{@admin_user.name}の登録ができました"
    rescue
      flash.now[:alert] = "管理ユーザーの登録ができませんでした"
      render "new"
    end
  end

  def show
    authenticate_role!
  end
  
  def edit
    authenticate_role!
    editable_owner_admin_user!
  end
  
  def update
    authenticate_role!
    editable_owner_admin_user!
    begin
      @admin_user.update!(admin_user_params)
      redirect_to @admin_users_index_url, notice: "#{@admin_user.name}の内容を変更できました"
    rescue
      flash.now[:alert] = "#{@admin_user.name}の内容を変更できませんでした"
      render 'edit'
    end
  end

  def destroy
    authenticate_role!
    editable_owner_admin_user!
    begin
      @admin_user.destroy!
      redirect_to @admin_users_index_url|| admins_admin_users_path, notice: "#{@admin_user.name}を削除しました"
    rescue
      flash.now[:alert] = "#{@admin_user.name}を削除できませんでした"
      render 'index'
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

  def editable_owner_admin_user!
    return if current_admin.role.owner?
    return unless @admin_user.role.owner?
    flash[:alert] = "オーナー情報を編集する権限がありません。"
     redirect_to admins_admin_users_path
  end

  def authenticate_role!
    if current_admin.member?
      flash[:alert] = "管理者権限がありません。"
      redirect_to admins_root_path
    end
  end
end

