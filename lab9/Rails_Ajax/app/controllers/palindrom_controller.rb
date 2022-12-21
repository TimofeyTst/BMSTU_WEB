class PalindromController < ApplicationController
  # before_action :require_params, only: [:show]

  def input; end

  def palindroms_before(n)
    [*1..n].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end

  def show
    @result = palindroms_before(params[:n].to_i)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # def require_params
  #   if params[:n].nil? || params[:n].empty?
  #     flash[:error] = 'Error: Empty params'
  #     redirect_to palindrom_input_path
  #   elsif !params[:n].match(/^\d+$/)
  #     flash[:error] = "Error: Incorrect params'#{params[:n]}'"
  #     redirect_to palindrom_input_path
  #   end
  # end 
end
