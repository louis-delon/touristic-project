class Site < ApplicationRecord

  # Config =====================================================================
  acts_as_list
  enum category: %i[restaurant bar shop hiking]

  # Associations ===============================================================

  has_many :addresses
  has_many :sectors, through: :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank
  has_rich_text :description
  has_one_attached :picture

  # Validations ================================================================

  validates :title, :opening_time, :description, :phone_number, :category, :picture, presence: true

end
