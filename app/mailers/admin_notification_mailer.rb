class AdminNotificationMailer < ApplicationMailer
  default to: -> { [ENV['ADMIN_EMAIL'], ENV['ADMIN_INFO_EMAIL'], ENV['ADMIN_OFFICER_EMAIL']].compact }

  def contact_notification(contact)
    @contact = contact
    @contact_show_url = admins_contact_url(@contact)
    mail(subject: '新しいお問い合わせがあります')
  end

  def job_entry_notification(job_entry)
    @job_entry = job_entry
    @job_entry_show_url = admins_job_entry_url(@job_entry)
    mail(subject: '新しい採用応募があります')
  end
end
