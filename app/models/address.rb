class Address < ApplicationRecord

  # Associations ===============================================================

  belongs_to :site
  belongs_to :sector

  # Validations ================================================================

  validates :street, :postal_code, :city, presence: true

end
