# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'
require 'capybara/rails'
require 'selenium-webdriver'
require 'json'
include RSpec::Expectations

RSpec.describe 'Palindrom' do
  describe '/input' do
    context 'should return' do
      it 'http success' do
        get root_path
        expect(response).to have_http_status(:success)
      end

      it 'body contains form' do
        get root_path, params: { n: '145' }
        xml = Nokogiri::XML(response.body)
        form = xml.xpath('//*[@id="n"]')
        expect(form.attr('name').content).to eq('n')
      end
    end

    context 'When params are correct' do
      subject { post result_path, params: { n: 145 }, xhr: true }

      it 'should return http success' do
        subject
        expect(response).to have_http_status(:success)
      end

      it 'should calculate correct result' do
        subject
        expect(assigns(:result)).to eq([1, 2, 3, 11, 22, 101, 111, 121])
      end

      it 'should render partial _result' do
        subject
        expect(response).to render_template("_result")
      end

      it 'should render partial _error' do
        post result_path, xhr: true
        expect(response).to render_template("_error")
      end
    end
  end

  describe 'Capybara test case', type: :feature do
    context 'Capybara test case' do
      it 'body should contain header' do
        visit root_path
        expect(page).to have_content 'Palindroms'
      end
    end
  end

  describe 'Selenium WebDriver open root_path and' do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @accept_next_alert = true
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
      # @vars = {}
    end

    after(:each) do
      @driver.quit
      expect(@verification_errors.size).to be_zero
    end

    it 'send n = 1568l body should contain error' do
      @driver.get 'http://localhost:3000/'
      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys '1568l'
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '//div[@id=\'result\']/div').text).to eq('Error: Incorrect params\'1568l\'')
    end

    it 'params are empty body should contain error' do
      @driver.get 'http://localhost:3000/'
      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '//div[@id=\'result\']/div').text).to eq('Error: Empty params')
    end

    it 'send default params body should contain ' do
      @driver.get 'http://localhost:3000/'
      @driver.find_element(:id, 'n').click
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:css, '.row:nth-child(13) > .col-6').text).to eq('1234321')
    end

    it 'n = 145 body should contain 14641' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys('145')
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '//div[@id=\'result\']/div/div[9]/div[3]').text).to eq('14641')
    end

    it 'After errors body should contain result' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys('122')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys('')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys('s')
      @driver.find_element(:name, 'commit').click

      @driver.find_element(:id, 'n').click
      @driver.find_element(:id, 'n').clear
      @driver.find_element(:id, 'n').send_keys('500')
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:css, '.row:nth-child(11) > .col-6').text).to eq('44944')
    end
  end
end
