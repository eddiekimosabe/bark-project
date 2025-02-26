class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :dogs
  #dependent: :destroy ensures that when user gets destroyed all likes associated gets destroyed
  has_many :likes, dependent: :destroy
end
