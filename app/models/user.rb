class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :entities, dependent: :destroy

  validates :name, presence: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def c_total
    total = 0
    calcul = groups.map(&:total).reduce(:+)
    total += calcul if calcul
    total
  end
end
