require 'rails_helper'

RSpec.feature 'Room' do
  let!(:user) { create(:user) }

  describe 'Operations on term', :type => :feature do
    let!(:term) { create(:term) }

    before(:each) do
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'Wpisz hasło', with: user.password
      click_button 'Zaloguj się'
      click_link 'Rezerwacje'
    end

    it 'shows index term page' do
      expect(page).to have_content 'Dodaj rezerwację'
    end

    it 'adds term' do
      click_on 'Dodaj rezerwację'
      fill_in 'Data rozpoczęcia', with: Date.current
      fill_in 'Data zakończenia', with: Date.current + 1
      fill_in 'Ilość rezerwowanych miejsc (łóżek)', with: 1
      click_on 'Zapisz'
      expect(page).to have_content Date.current && Date.current + 1 && term.client.first_name
    end

    it 'deletes term' do
      click_on 'x'
      expect(page).not_to have_content Date.current
    end

    it 'edits term' do
      click_on 'Edytuj'
      fill_in 'Data zakończenia', with: Date.current + 4
      click_on 'Zapisz'
      expect(page).to have_content Date.current + 4
    end

  end
end
