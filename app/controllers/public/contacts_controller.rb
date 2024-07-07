class Public::ContactsController < Public::ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    begin
      if params[:back]
        render "new"
      else
        @contact.save!
        AdminNotificationMailer.contact_notification(@contact).deliver_now
        PublicNotificationMailer.contact_notification(@contact).deliver_now
        redirect_to complete_contacts_path
      end
    rescue StandardError => e
      # メール送信中にエラーが発生した場合の処理
      Rails.logger.error "メール送信中にエラーが発生しました: #{e.message}"
      render "new"
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render "new"
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_type, :message, :name, :name_kana, :email, :phone_number, :callback_requested, :contact_method)
  end
end
