class Admins::HomeController < Admins::ApplicationController
  def show
    @contacts = Contact.all
    @total_contacts = @contacts.size
    @total_contacts_with_not_started = Contact.with_status(:not_started).size
    @total_contacts_created_today = Contact.where(created_today).size
    @latest_contact = Contact.order(created_at_desc).first
    @prior_latest_contact = Contact.order(created_at_desc).second
    @job_entries = JobEntry.all
    @total_job_entries = @job_entries.size
    @total_jobentries_created_today = JobEntry.where(created_today).size
    @shops = Shop.all
    @total_shops = @shops.size
    @latest_shop = Shop.order(created_at_desc).first
    @news = News.all
    @total_news = @news.size
    @total_news_unstarted = News.where(unstarted).count
    @latest_news = News.order(created_at_desc).first
    @total_articles_unstarted = Article.where(unstarted).count
  end

  private

  def created_today
    ["created_at >= ?", Time.zone.now.beginning_of_day]
  end

  def created_at_desc
    [created_at: :desc]
  end

  def unstarted
    ["start_at > ?", Time.zone.now]
  end
end
