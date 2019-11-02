class Site < ApplicationRecord

  # Config =====================================================================
  acts_as_list
  enum category: %i[restaurant bar shop hiking]

  # Associations ===============================================================

  has_and_belongs_to_many :sectors, inverse_of: :sites, counter_cache: true
  has_one :address, dependent: :destroy
  has_one_attached :picture
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

  # Validations ================================================================

  validates :title, :opening_time, :description, :phone_number, :category, :picture, presence: true

end
