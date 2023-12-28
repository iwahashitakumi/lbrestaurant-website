class Public::ArticlesController < Public::ApplicationController
  def index
    @articles = Article.with_status(:published).page(params[:page]).per(6)
    @category_css_class = category_css_class(@articles.category)
  end

  def show
    @article = Article.with_status(:published).find(params[:id])
    @category_css_class = category_css_class(@article.category)
  end

  private

  def category_css_class(category)
    case category
    when :event
      'event-category'
    when :company_trip
      'company-trip-category'
    when :staff_introduction
      'staff-introduction-category'
    when :other
      'other-category'
    end
  end
end
