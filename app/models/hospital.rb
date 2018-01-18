class Hospital < ApplicationRecord
  validates :num, presence: true, numericality: { only_integer: true ,greater_than: 0}, uniqueness: true

  has_and_belongs_to_many :staffs
end
