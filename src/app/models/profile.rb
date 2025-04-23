class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :user_icon
  has_one_attached :bg_image

  validates :introduction, length: { maximum: 1000 }, allow_blank: true
  validates :skills, length: { maximum: 1000 }, allow_blank: true
  validates :company_name, length: { maximum: 100 }, allow_blank: true
  validates :industry, length: { maximum: 100 }, allow_blank: true
end