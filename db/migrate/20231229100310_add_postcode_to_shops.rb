class AddPostcodeToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :postcode, :string, null: false,                comment: "店舗の郵便番号"
  end
end
