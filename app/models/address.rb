class Address < ApplicationRecord

  # Config =====================================================================

  geocoded_by :address

  # Callbacks ==================================================================

  after_validation :geocode

  # Associations ===============================================================

  belongs_to :site
  belongs_to :sector

  # Validations ================================================================

  validates :street, :postal_code, :city, :sector_id, presence: true

  def address
    [street, postal_code, city].compact.join(', ')
  end

end
