namespace :news_status do
  desc "公開開始時間と公開終了時間に基づいてお知らせを自動的に公開します"
  task :change_to_be_published => :environment do
    News.before_published.find_each do |news|
      news.update_columns(status: :published)
    end
  end

  desc "公開終了時間を超えたお知らせを自動的に非公開にします"
  task :change_to_be_expire => :environment do
    News.next_expired.find_each do |news|
      news.update_columns(status: :expired)
    end
  end
end
