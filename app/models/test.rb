class Test < ApplicationRecord
  validates  :codenumber, :test_type, presence: true

  def is_unique(code)
    if Test.find_by_codenumber(code).length == 1
      return true
    else
      return false
    end
  end

  def is_truemedicine(code)
    if Code.find_by_codenumber(code)
      return true
    else
      return false
    end
  end
end
