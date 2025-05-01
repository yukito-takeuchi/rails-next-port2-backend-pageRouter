class Job < ApplicationRecord
  belongs_to :company, class_name: 'User', foreign_key: 'company_id'
  has_many :applications # Application モデルが存在する場合
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :salary, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end