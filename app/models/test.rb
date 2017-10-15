class Test < ApplicationRecord
  validates  :codenumber, :test_type, presence: true

  def is_unique(code)
    if Test.where(codenumber: code).size == 1
      return true
    else
      return false
    end
  end

  def is_truemedicine(code)
    if Truemedicine.where(codenumber: code)
      return true
    else
      return false
    end
  end
end
