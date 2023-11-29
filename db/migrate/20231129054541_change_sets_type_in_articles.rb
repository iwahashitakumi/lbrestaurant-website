class ChangeSetsTypeInArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :sets, :json, null: false
  end
end
