class Sector < ApplicationRecord

  # Associations ===============================================================
  has_many :sites, inverse_of: :sector

  # Validations ================================================================
  validates :name, :illustration, :description, :city, :sort, presence: true

end
