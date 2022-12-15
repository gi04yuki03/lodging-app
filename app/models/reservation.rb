class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :person_num, presence: true
  validate :date_before_start
  validate :start_end_check
   
  def date_before_start
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today 
  end
  
  def start_end_check
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日より前の日付は登録できません") unless
    start_date < end_date 
  end
end
