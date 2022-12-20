class Group < ApplicationRecord
  has_and_belongs_to_many :entities
  belongs_to :user

  validates :name, presence:true, length:{minimum: 2}

  def total
    entities.map{|e| e.amount}.reduce(:+)
  end
end
