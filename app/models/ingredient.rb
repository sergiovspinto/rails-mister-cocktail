class Ingredient < ApplicationRecord
  has_many :cocktails, through: :doses
  has_many :doses
  before_destroy :check_for_cocktails
  validates :name, presence: true, uniqueness: true

  private

  def check_for_cocktails
    if cocktails.count.positive?
      errors.add_to_base('cannot delete ingredient while cocktails exist')
    else
      false
    end
  end
end
