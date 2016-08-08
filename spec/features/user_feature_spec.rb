require 'rails_helper'

RSpec.feature 'Client' do
  let!(:user) { create(:user) }

  describe 'Signin in correctly', :type => :feature do
    it 'signed in by correct data' do  
      visit root_path
      fill_in 'Wpisz adres email:', with: user.email
      fill_in 'Wpisz hasło', with: user.password
      click_button 'Zaloguj się'
      expect(page).to have_content 'Dodaj pokój'
    end

    it 'signed in by incorrect data' do
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'Wpisz hasło', with: "#{user.password}12"
      click_button 'Zaloguj się'
      expect(page).to have_content 'Zaloguj się'
    end
  end
end
