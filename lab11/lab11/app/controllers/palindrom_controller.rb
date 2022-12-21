class PalindromController < ApplicationController
  def input; end

  def show
    if (query = Palindrom.find_by(upper: params[:n]))
      @notice = 'FROM DB'
      @result = query
    else
      palindrom = Palindrom.new(upper: params[:n])
      if palindrom.save
        @notice = 'SAVE TO DB'
        @result = palindrom
      else
        flash[:error] = palindrom.errors.messages[:upper]
        redirect_to root_path
      end
    end
  end

  def results
    arr = []
    Palindrom.all.each { |el| arr << { upper: el.upper, result: el.result } }
    render xml: arr
  end
end
