class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :owner_id, :presence => true

end
