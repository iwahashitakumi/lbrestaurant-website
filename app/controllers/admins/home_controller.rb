class Admins::HomeController < Admins::ApplicationController
  def show
    load_contacts
    load_job_entries
    load_shops
    load_news
    load_articles
  end

  private

  def load_contacts
    @contacts = Contact.all
    @total_contacts = @contacts.size
    @total_contacts_with_not_started = Contact.with_status(:not_started).size
    @total_contacts_created_today = Contact.where(created_today).size
    @latest_contact = Contact.order(created_at_desc).first
    @prior_latest_contact = Contact.order(created_at_desc).second
  end

  def load_job_entries
    @job_entries = JobEntry.all
    @total_job_entries = @job_entries.size
    @total_job_entries_with_not_started = JobEntry.with_status(:not_started).size
    @total_job_entries_created_today = JobEntry.where(created_today).size
    @latest_job_entries = JobEntry.order(created_at_desc).first
    @prior_latest_job_entries = JobEntry.order(created_at_desc).second
  end

  def load_shops
    @shops = Shop.all
    @total_shops = @shops.size
    @latest_shop = Shop.order(created_at_desc).first
  end

  def load_news
    @news = News.all
    @total_news = @news.size
    @total_news_unstarted = News.unpublished.count
    @latest_news = News.order(created_at_desc).first
  end

  def load_articles
    @total_articles_unstarted = Article.with_state(:unpublished).count
  end

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
