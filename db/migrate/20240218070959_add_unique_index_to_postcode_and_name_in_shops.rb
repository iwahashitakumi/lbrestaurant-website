class AddUniqueIndexToPostcodeAndNameInShops < ActiveRecord::Migration[7.0]
  def change
    add_index :shops, :postcode, unique: true
    add_index :shops, :name, unique: true
  end
end
