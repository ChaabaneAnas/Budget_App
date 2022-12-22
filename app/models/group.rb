class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities

  validates :name, presence:true, length:{minimum: 2}

  def total
    total = 0
    calcul = entities.map{|e| e.amount}.reduce(:+)
    if calcul
      total +=  calcul
    end
    total
  end
end
