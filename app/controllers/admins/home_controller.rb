class Admins::HomeController < Admins::ApplicationController
  def show
    @contacts = Contact.all
    @total_contacts = @contacts.size
    @total_contacts_with_not_started = Contact.with_status(:not_started).size
    @total_contacts_created_today = Contact.where(created_today).size
    @shops = Shop.all
    @total_shops = @shops.size
    @news = News.all
    @total_news = @news.size
  end

  private

  def created_today
    ["created_at >= ?", Time.zone.now.beginning_of_day]
  end
  
end
