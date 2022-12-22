class Entity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true
  # validates :groups, presence:true, length {minimum:1}
end
