class ChangeSetsTypeInArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :sets, 'json USING CAST(sets AS json)', null: false
  end
end
