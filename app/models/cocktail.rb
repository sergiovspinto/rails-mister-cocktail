class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true
#  before_destroy :check_for_cocktails#

#  private#

#  def check_for_cocktails
#    if cocktails.count.positive?
#      return false
#    else
#      errors.add_to_base('cannot delete ingredient while cocktails exist')
#    end
#  end
end
