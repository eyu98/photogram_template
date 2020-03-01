class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :owner_id, :presence => true

end
