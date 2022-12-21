class Palindrom < ApplicationRecord
  validates :upper, {
    presence: { message: 'Error: Empty params'},
    numericality: { 
      only_integer: true, 
      greater_than: 0,
      message: "Error: Incorrect params '%{value}'"
    }
  }

  before_save :set_result

  def decoded_result
    ActiveSupport::JSON.decode(result)
  end

  private

  def set_result
    self.result = ActiveSupport::JSON.encode(palindroms_before)
  end

  def palindroms_before
    [*1..upper].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end
end
