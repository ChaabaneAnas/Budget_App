class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups , dependent: :destroy
  has_many :entities , dependent: :destroy


  def cTotal
       total = 0
       calcul = groups.map {|categorie| categorie.total}.reduce(:+)
       if calcul
              total += calcul
       end    
       total
  end  

#   validates :name, presence:true
end
