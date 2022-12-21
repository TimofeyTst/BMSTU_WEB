# frozen_string_literal: true

# Docs
class RenderXmlController < ApplicationController
  def show
    result = palindroms_before params[:n].to_i

    data = if result.empty?
             { message: "Error: incorrect params #{params[:n]}" }
           else
             result.map { |el| { palindrom: el, square: el**2 } }
           end

    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  private

  def palindroms_before(number)
    [*1..number].select { |el| el.to_s.reverse == el.to_s && (el**2).to_s.reverse == (el**2).to_s }
  end
end
