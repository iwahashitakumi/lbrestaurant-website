namespace :news_state do
  desc "公開開始時間と終了時間に基づいてニュースを自動的に公開します"
  task :change_to_be_published => :environment do
    News.before_published.find_each do |news|
      news.update_columns(state: :published)
    end
  end

  desc "公開中でかつ終了時間を超えた記事を自動的に非公開にします"
  task :change_to_be_expire => :environment do
    News.next_expired.find_each do |news|
      news.update_columns(state: :expired)
    end
  end
end
