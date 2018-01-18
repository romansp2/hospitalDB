class Staff < ApplicationRecord
  validates :sname, presence: true, length: { minimum: 2, maximum: 15}
  validates :bday, presence:true, format: { with: /(\d{4})\-(0\d|1[012])\-([0-2]\d|3[01])/}
  validates :position, presence:true, inclusion: { in: %w(Doctor Nurse Paramedic)}

  has_and_belongs_to_many :hospitals


end
