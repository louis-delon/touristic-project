class Sector < ApplicationRecord

# Associations =================================================================


# Validations ==================================================================

validates :name, :illustration, :description, :city, :sort, presence: true

end
