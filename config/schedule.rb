require File.expand_path(File.dirname(__FILE__) + '/environment')


rails_env = ENV['RAILS_ENV'] || :development


set :environment, rails_env


set :output, "#{Rails.root}/log/cron.log"


every :minute do
  rake 'news_status:change_to_be_published'
  rake 'news_status:change_to_be_expire'
  rake 'article_status:change_to_be_published'
  rake 'article_status:change_to_be_expire'
end

