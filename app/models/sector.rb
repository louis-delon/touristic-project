class Sector < ApplicationRecord

  # Config =====================================================================

  acts_as_list

  # Associations ===============================================================
  has_many :addresses
  has_many :sites, through: :addresses
  has_rich_text :description
  has_one_attached :illustration

  # Validations ================================================================

  validates :name, :illustration, :description, :city, presence: true
  validates :illustration, attached: true, content_type: [:png, :jpg, :jpeg]

end
