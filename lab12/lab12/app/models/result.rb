class Result < ApplicationRecord
  validates :upper, {
    presence: { message: 'Error: Empty params' },
    numericality: {
      only_integer: true,
      greater_than: 0,
      message: "Error: Incorrect params '%<value>s'"
    }
  }

  before_save :set_palindroms

  def decoded_result
    ActiveSupport::JSON.decode(palindroms)
  end

  private

  def set_palindroms
    self.palindroms = ActiveSupport::JSON.encode(palindroms_before)
  end

  def palindroms_before
    [*1..upper].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end
end
