class Admins::HomeController < Admins::ApplicationController
  def show
    @contacts = Contact.all
    @total_contacts = @contacts.size
    @shops = Shop.all
    @total_shops = @shops.size
    @news = News.all
    @total_news = @news.size
  end
end
