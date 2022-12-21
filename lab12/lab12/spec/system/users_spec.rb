require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'GET ' do
    context 'Should return' do
      before do
        User.create(login: 'azam', password: '1111')
      end

      scenario 'success while registration' do
        visit new_user_path
        fill_in :user_login, with: 'tst'
        fill_in :user_password, with: '1111s'
        fill_in :user_password_confirmation, with: '1111s'
        find('.button').click
        sleep(0.1)
        expect(current_path).to eq '/users/2'
      end

      scenario 'results after success login' do
        visit root_path
        fill_in :login, with: 'azam'
        fill_in :password, with: '1111'
        find('.button').click

        sleep(0.1)

        visit root_path
        find('#ok').click
        expect(current_path).to eq(root_path)
      end
    end

    scenario 'shouldn`t redirect without auth' do
      routes = [root_path, users_path, '/users/1', session_new_path, results_path, new_result_path]
      routes.each do |route|
        visit route
        expect(current_path).to eq session_new_path
      end
    end
  end
end
