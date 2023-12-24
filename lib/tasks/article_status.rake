namespace :article_status do
  desc "公開開始時間と公開終了時間に基づいてブログを自動的に公開します"
  task :change_to_be_published => :environment do
    Article.before_published.find_each do |article|
      article.update_columns(status: :published)
    end
  end

  desc "公開終了時間を超えたブログを自動的に非公開にします"
  task :change_to_be_expire => :environment do
    Article.next_expired.find_each do |article|
      article.update_columns(status: :expired)
    end
  end
end
