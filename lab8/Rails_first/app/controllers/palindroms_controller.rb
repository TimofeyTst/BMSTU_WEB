# frozen_string_literal: true

# Documentation
class PalindromsController < ApplicationController
  before_action :require_params, only: [:show]

  def input; end

  def show
    @result = palindroms_before(params[:n].to_i)
  end

  private

  # rubocop:disable Naming/MethodParameterName
  def palindroms_before(n)
    [*1..n].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end
  # rubocop:enable Naming/MethodParameterName

  # rubocop:disable Metrics/AbcSize
  def require_params
    if params[:n].nil? || params[:n].empty?
      flash[:error] = 'Error: Empty params'
      redirect_to palindroms_input_path
    elsif !params[:n].match(/^\d+$/)
      flash[:error] = "Error: Incorrect params'#{params[:n]}'"
      redirect_to palindroms_input_path
    end
  end
  # rubocop:enable Metrics/AbcSize
end
