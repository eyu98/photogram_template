class AddLocationFormattedAddressToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :location_formatted_address, :string
  end
end
