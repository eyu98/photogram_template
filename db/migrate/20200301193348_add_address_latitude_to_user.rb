class AddAddressLatitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_latitude, :float
  end
end
