require File.expand_path(File.dirname(__FILE__) + '/environment')

set :path_env, ENV['PATH']
job_type :runner, "cd :path && PATH=':path_env' bin/rails runner -e :environment ':task' :output"
job_type :rake,   "cd :path && PATH=':path_env' :environment_variable=:environment bundle exec rake :task --silent :output"

rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env

set :output, "#{Rails.root}/log/cron.log"


every :minute do
  rake 'news_status:change_to_be_published'
  rake 'news_status:change_to_be_expire'
  rake 'article_status:change_to_be_published'
  rake 'article_status:change_to_be_expire'
end

