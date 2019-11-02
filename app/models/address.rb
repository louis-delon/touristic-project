class Address < ApplicationRecord

  # Associations ===============================================================

  belongs_to :site

  # Validations ================================================================

  validates :street, :postal_code, :city, presence: true

end
