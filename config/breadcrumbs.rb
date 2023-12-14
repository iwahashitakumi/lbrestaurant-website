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
