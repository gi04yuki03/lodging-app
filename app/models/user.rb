class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  
  with_options on: :step1 do
    validates :profile,:name,:profile_image, presence: true
  end
         
  has_many :posts, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
