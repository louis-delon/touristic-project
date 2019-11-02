class Sector < ApplicationRecord

  # Config =====================================================================

  has_rich_text :description
  acts_as_list

  # Associations ===============================================================

  has_many :sites, inverse_of: :sector
  has_one_attached :illustration

  # Validations ================================================================

  validates :name, :illustration, :description, :city, presence: true
  validates :illustration, attached: true, content_type: [:png, :jpg, :jpeg]

end
