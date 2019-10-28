class Site < ApplicationRecord

  # Config =====================================================================

  enum category: %i[restaurant bar shop hiking]

  # Associations ===============================================================

  belongs_to :sector, inverse_of: :sites

  # Validations ================================================================

  validates :opening_time, :description, :phone_number, :category, :picture, presence: true

end
