class Test < ApplicationRecord
  validates  :codenumber, :test_type, presence: true
end
