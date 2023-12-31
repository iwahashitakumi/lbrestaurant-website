class RemoveAndAddColumnsToShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :latitude, :float
    remove_column :shops, :longitude, :float

    
    add_column :shops, :google_map_iframe, :string,  comment: "Google Map Iframe"
  end
end
