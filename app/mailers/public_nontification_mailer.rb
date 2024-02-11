class PublicNotificationMailer < ApplicationMailer
  default from: ENV['ADMIN_INFO_EMAIL']

  def contact_notification(contact)
    @contact = contact
    mail(to: @contact.email, subject: '株式会社LBrestaurantです。 お問い合わせありがとうございます')
  end

  def job_entry_notification(job_entry)
    @job_entry = job_entr
    mail(to: @job_entry.email, subject: '株式会社LBrestaurantです! 応募ありがとうございます')
  end
end

