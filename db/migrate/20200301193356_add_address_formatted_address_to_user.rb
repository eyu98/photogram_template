class AddAddressFormattedAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_formatted_address, :string
  end
end
