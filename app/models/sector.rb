class Sector < ApplicationRecord

  # Config =====================================================================

  has_rich_text :description
  acts_as_list

  # Associations ===============================================================

  has_and_belongs_to_many :sites, inverse_of: :sectors, counter_cache: true
  has_one_attached :illustration

  # Validations ================================================================

  validates :name, :illustration, :description, :city, presence: true
  validates :illustration, attached: true, content_type: [:png, :jpg, :jpeg]

end
