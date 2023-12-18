class Admins::ContactsController < Admins::ApplicationController

  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result(distinct: true).page(params[:page])
    session[:contacts_index_url] = request.url
  end

  def show
    @contacts_index_url = session[:contacts_index_url]
    @contact = Contact.find(params[:id])
  end

  def update
    @contacts_index_url = session[:contacts_index_url]
    @contact = Contact.find(params[:id])
    begin
      @contact.update!(contact_params)
      redirect_to @contacts_index_url, notice: "#{@contact.name}の対応状況を変更できました"
    rescue
      flash.now[:alert] = "#{@contact.name}の対応状況を変更できませんでした"
      render 'show'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_type, :message, :name, :name_kana, :email, :phone_number, :callback_requested, :contact_method, :status).merge(update_by: current_admin.id)
  end
  
end
