class AddOwnPhotoCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :own_photos_count, :integer
  end
end
