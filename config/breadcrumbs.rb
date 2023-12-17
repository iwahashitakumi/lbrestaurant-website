#トップ画面
  crumb :admins_root do
    link "ホーム", admins_root_path
  end

#管理ユーザー関連
  crumb :admins_admin_users do
    link "管理ユーザー一覧", admins_admin_users_path
    parent :admins_root
  end

  crumb :new_admins_admin_user do
    link "管理ユーザー登録", new_admins_admin_user_path
    parent :admins_admin_users
  end

  crumb :edit_admins_admin_user do
    link "管理ユーザー編集", edit_admins_admin_user_path
    parent :admins_admin_users
  end

  crumb :admins_admin_user do |admin_user|
    link "#{admin_user.name}さんの詳細", admins_admin_user_path(admin_user)
    parent :admins_admin_users
  end

#ブログ関連
  crumb :admins_articles do
    link "ブログ一覧", admins_articles_path
    parent :admins_root
  end

  crumb :new_admins_article do
    link "ブログ登録", new_admins_article_path
    parent :admins_articles
  end

  crumb :edit_admins_article do
    link "ブログ編集", edit_admins_article_path
    parent :admins_articles
  end

  crumb :admins_article do |article|
    link "タイトル:#{article.title}の詳細", admins_article_path(article)
    parent :admins_articles
  end

#問い合わせ関連
  crumb :admins_contacts do
    link "問い合わせ一覧", admins_contacts_path
    parent :admins_root
  end

  crumb :admins_contact do |contact|
    link "#{contact.name}さんの詳細", admins_contact_path(contact)
    parent :admins_contacts
  end

#採用応募関連
  crumb :admins_job_entries do
    link "採用応募一覧", admins_job_entries_path
    parent :admins_root
  end

  crumb :admins_contact do |contact|
    link "#{contact.name}さんの詳細", admins_contact_path(contact)
    parent :admins_job_entries
  end

#お知らせ関連
  crumb :admins_news_index do
    link "お知らせ一覧", admins_news_index_path
    parent :admins_root
  end

  crumb :new_admins_news do
    link "お知らせ登録", new_admins_news_path
    parent :admins_news_index
  end

  crumb :edit_admins_news do
    link "お知らせ編集", edit_admins_news_path
    parent :admins_news_index
  end

  crumb :admins_news do |news|
    link "タイトル:#{news.title}の詳細", admins_news_path(news)
    parent :admins_news_index
  end

#店舗関連
  crumb :admins_shops do
    link "店舗一覧", admins_shops_path
    parent :admins_root
  end

  crumb :discarded_admins_shops do
    link "削除した店舗一覧", discarded_admins_shops_path
    parent :admins_shops
  end

  crumb :new_admins_shop do
    link "店舗登録", new_admins_shop_path
    parent :admins_shops
  end

  crumb :edit_admins_shop do
    link "店舗編集", edit_admins_shop_path
    parent :admins_shops
  end

  crumb :admins_shop do |shop|
    link "タイトル:#{shop.name}の詳細", admins_shop_path(shop)
    parent :admins_shops
  end

  crumb :admins_shop_discarded do |shop|
    link "タイトル:#{shop.name}の詳細", admins_shop_path(shop)
    parent :discarded_admins_shops
  end
