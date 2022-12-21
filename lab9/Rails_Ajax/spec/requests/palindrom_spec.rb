require 'rails_helper'
require 'nokogiri'

RSpec.describe 'Palindroms', type: :request do
  scenario 'valid inputs' do
    get palindrom_input_path
    fill_in 'n', with: '145'
    click_on 'Commit'
    expect(page).to have_content('2')
  end

  describe 'path' do
    context '/input' do
      it 'should return http success' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context '/show' do
      context 'should return body contains' do
        it 'all palindroms from 1 to 145' do
          get palindrom_show_path, params: { n: '145' }
          html = Nokogiri::HTML(response.body)
          expects = [' 1 ', ' 4 ', ' 9 ', ' 121 ', ' 484 ', ' 10201 ', ' 12321 ', ' 14641 ']
          expects.each_with_index do |el, idx|
            div = html.search('div')[8 + idx * 4].text
            expect(div).to eq(el)
          end
        end
      end
    end
    
  end
end
