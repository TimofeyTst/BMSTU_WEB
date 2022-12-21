# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Documentation
class PalindromController < ApplicationController
  before_action :parse_params, only: :show
  before_action :require_params, only: :show
  before_action :prepare_url, only: :show

  def input; end

  def show
    api_response = URI.open(@url)

    case @side
    when 'On server'
      @result = xslt_server_transform(api_response).to_html
    when 'On client'
      render xml: xslt_browser_transform(api_response).to_xml
    else
      render xml: api_response
    end
  end

  private

  # Куда шлем запрос.
  BASE_API_URL = 'http://localhost:3000/?format=xml'
  # Откуда берем XSLT для преобразования на стороне сервера
  # (тут нужен обычный путь, Rails.root - путь к каталгу приложения).
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt".freeze
  # Откуда браузер должен брать XSLT. Это подставится к localhost:3001. Именно так грузятся файлы из public.
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'

  def parse_params
    @upper = params[:n]
    @side = params[:side]
  end

  def require_params
    if @upper.nil? || @upper.empty?
      flash[:error] = 'Error: Empty params'
      redirect_to root_path
    elsif !@upper.match(/^\d+$/)
      flash[:error] = "Error: Incorrect params'#{@upper}'"
      redirect_to root_path
    end
  end

  def prepare_url
    @url = "#{BASE_API_URL}&n=#{@upper}"
  end

  def xslt_server_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(XSLT_SERVER_TRANSFORM))
    xslt.transform(doc)
  end

  def xslt_browser_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    "type=\"text/xsl\" href=\"#{XSLT_BROWSER_TRANSFORM}\"")
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
