class AddAddressLongitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_longitude, :float
  end
end
