class PublicNotificationMailer < ApplicationMailer
  def contact_notification(contact)
    @contact = contact
    mail(to: @contact.email, subject: '【LBrestaurant株式会社】お問い合わせ有難うございます。')
  end

  def job_entry_notification(job_entry)
    @job_entry = job_entry
    mail(to: @job_entry.email, subject: '【LBrestaurant株式会社】採用応募有難うございます!')
  end
end
