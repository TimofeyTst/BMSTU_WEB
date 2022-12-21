require 'rails_helper'
require 'nokogiri'

RSpec.describe 'Palindroms', type: :request do
  describe 'path' do
    context '/input' do
      it 'should return http success' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context '/show' do
      it 'should return success if input correct params' do
        get palindroms_show_path, params: { n: 25 }
        expect(response).to have_http_status(:success)
      end

      context 'shouldn`t redirect and return http Error if' do
        it 'redirecting was without params' do
          get palindroms_show_path
          expect(response).to have_http_status(302)
        end

        it 'redirecting was with empty params' do
          get palindroms_show_path, params: {}
          expect(response).to have_http_status(302)
        end

        it 'input \'25s\'' do
          get palindroms_show_path, params: { n: '25s' }
          expect(response).to have_http_status(302)
        end

        it 'input \'h25\'' do
          get palindroms_show_path, params: { n: 'h25' }
          expect(response).to have_http_status(302)
        end

        it 'input words' do
          get palindroms_show_path, params: { n: 'khxuizv' }
          expect(response).to have_http_status(302)
        end
      end

      context 'should return body contains' do
        it 'all palindroms from 1 to 145' do
          get palindroms_show_path, params: { n: '145' }
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
