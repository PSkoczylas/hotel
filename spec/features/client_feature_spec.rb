require 'rails_helper'

RSpec.feature 'Client' do
  let!(:user) { create(:user) }

  describe 'Operations on client', :type => :feature do

    let!(:client) { create(:client) }

    before(:each) do
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'Wpisz hasło', with: user.password
      click_button 'Zaloguj się'
      click_link 'Klienci'
    end

    it 'shows index client page ' do
      expect(page).to have_content 'Dodaj klienta'
    end

    it 'adds client' do
      click_on 'Dodaj klienta'
      fill_in 'Imię', with: 'Henryk'
      fill_in 'Nazwisko', with: 'Gólski'
      fill_in 'Numer telefonu', with: "#{client.phone_number}3"
      fill_in 'email', with: 'golski@henryk.com'
      click_on 'Zapisz' 
      expect(page).to have_content 'Henryk Gólski' && 'Edytuj'
    end

    it 'deletes client' do
      click_on 'x'
      expect(page).not_to have_content client.first_name
    end

    it 'edits client' do
      click_on 'Edytuj'
      fill_in 'Imię', with: 'Zdzich'
      click_on 'Zapisz'
      expect(page).to have_content 'Zdzich'
    end

    it 'shows client' do
      click_on client.first_name
      expect(page).not_to have_content 'Dodaj klienta'
    end
  end
end
