class Admins::ContactsController < Admins::ApplicationController

  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result(distinct: true).page(params[:page])
    session[:contacts_index_url] = request.url
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_type, :message, :name, :name_kana, :email, :phone_number, :callback_requested, :contact_method, :status).merge(update_by: current_admin.id)
  end
  
end
