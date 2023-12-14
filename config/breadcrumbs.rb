crumb :admins_root do
  link "ホーム", admins_root_path
end

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
