require File.expand_path(File.dirname(__FILE__) + '/environment')


rails_env = ENV['RAILS_ENV'] || :development


set :environment, rails_env


set :output, "#{Rails.root}/log/cron.log"


every :hour do
  rake 'news_state:change_to_be_published'
  rake 'news_state:change_to_be_expire'
end
