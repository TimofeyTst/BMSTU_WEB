class PalindromController < ApplicationController
  def show
    if (query = Result.find_by(upper: params[:n]))
      @notice = 'FROM DB'
      @result = query
    else
      palindrom = Result.new(upper: params[:n])
      if palindrom.save
        @notice = 'SAVE TO DB'
        @result = palindrom
      else
        @error = palindrom.errors.messages[:upper]
      end
    end
  end
end
