# frozen_string_literal: true

# Documentation
class PalindromController < ApplicationController
  before_action :require_params, only: [:show]

  def input; end

  def show
    @result = palindroms_before(params[:n].to_i)
  end

  private

  def palindroms_before(number)
    [*1..number].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end

  def require_params
    if !params[:n].presence
      @error = 'Error: Empty params'
    elsif !params[:n].match(/^\d+$/)
      @error = "Error: Incorrect params'#{params[:n]}'"
    end
  end
end
