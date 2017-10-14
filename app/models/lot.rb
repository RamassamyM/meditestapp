class Lot < ApplicationRecord
  has_many :truemedicines
  validates :name, :laboratory, :lot_number, presence: true
end
