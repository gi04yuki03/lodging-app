class Post < ApplicationRecord
  attachment :image
  
  belongs_to :user
  has_many :reservations
  
  validates :price,:name,:address, presence: true
  
  validates :introduction, presence: true, length: { maximum: 195 }
  validates :image, presence: true
  
  
end
