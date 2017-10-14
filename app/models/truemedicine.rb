class Truemedicine < ApplicationRecord
  belongs_to :lot
  validates :codenumber, presence: true
end
