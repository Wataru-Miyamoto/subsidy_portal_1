class CityTopic < ApplicationRecord
  belongs_to :city

  validates :title, presence: true, length: { maximum: 70 }
  validates :period, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :target, presence: true, length: { maximum: 200 }
  validates :counter, presence: true, length: { maximum: 100 }
  validates :link, presence: true, length: { maximum: 600 }
end
