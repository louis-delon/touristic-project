class Sector < ApplicationRecord

  # Associations ===============================================================
  has_many :sites, inverse_of: :sector
  has_one_attached :illustration

  # Validations ================================================================
  validates :name, :illustration, :description, :city, :sort, presence: true
  validates :avatar, attached: true, content_type: [:png, :jpg, :jpeg]
end
