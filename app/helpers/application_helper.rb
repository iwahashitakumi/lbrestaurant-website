module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%Y/ %m/ %d /%H:%M")
  end

  def format_date(date)
    date.strftime("%Y/ %m/ %d")
  end
end
