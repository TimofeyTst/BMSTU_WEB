require 'rails_helper'
require 'selenium-webdriver'
require 'nokogiri'

RSpec.describe "Palindroms", type: :request do
  describe "Show" do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
    end

    after(:each) do
      @driver.quit
    end

    context 'when params incorrected' do
      it 'should consist empty-message' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'n').click
        @driver.find_element(:id, 'n').clear
        @driver.find_element(:id, 'side_blank_xml').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, '.error-text').text).to eq('Error: Empty params')
      end

      it 'should consist incorrect-message' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'n').click
        @driver.find_element(:id, 'n').send_keys('asd;')
        @driver.find_element(:id, 'side_blank_xml').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, '.error-text').text).to eq('Error: Incorrect params\'5262asd;\'')
      end
    end

    context 'when send default params' do
      it 'for get blank XML' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'side_blank_xml').click
        @driver.find_element(:name, 'commit').click
        xml = Nokogiri::XML(@driver.page_source)
        text = xml.xpath('//objects/object[13]/square/text()').text
        expect(text).to eq('4008004')
      end

      it 'On server' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'side_on_server').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, 'tr:nth-child(13) > th:nth-child(3)').text).to eq('4008004')
      end

      it 'On client' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'side_on_client').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, 'tr:nth-child(13) > th:nth-child(3)').text).to eq('4008004')
      end
    end

    context 'when send params = 500' do
      it 'for get blank XML' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'n').click
        @driver.find_element(:id, 'n').clear
        @driver.find_element(:id, 'n').send_keys('500')
        @driver.find_element(:id, 'side_blank_xml').click
        @driver.find_element(:name, 'commit').click
        xml = Nokogiri::XML(@driver.page_source)
        text = xml.xpath('//objects/object[10]/square/text()').text
        expect(text).to eq('44944')
      end

      it 'On server' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'n').click
        @driver.find_element(:id, 'n').clear
        @driver.find_element(:id, 'n').send_keys('500')
        @driver.find_element(:id, 'side_on_server').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, 'tr:nth-child(10) > th:nth-child(3)').text).to eq('44944')
      end

      it 'On client' do
        @driver.get('http://localhost:3001/')
        @driver.find_element(:id, 'n').click
        @driver.find_element(:id, 'n').clear
        @driver.find_element(:id, 'n').send_keys('500')
        @driver.find_element(:id, 'side_on_client').click
        @driver.find_element(:name, 'commit').click
        expect(@driver.find_element(:css, 'tr:nth-child(10) > th:nth-child(3)').text).to eq('44944')
      end
    end
  end
end
