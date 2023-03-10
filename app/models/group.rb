class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { minimum: 3 }
  validates :icon, presence: true

  def total
    total = 0
    calcul = entities.map(&:amount).reduce(:+)
    total += calcul if calcul
    total
  end
end
