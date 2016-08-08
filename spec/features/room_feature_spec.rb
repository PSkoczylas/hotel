require 'rails_helper'

RSpec.feature 'Room' do
  let!(:user) { create(:user) }

  describe 'Operations on room', :type => :feature do

    let!(:room) { create(:room) }

    before(:each) do
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'Wpisz hasło', with: user.password
      click_button 'Zaloguj się'
    end

    it 'shows index client page ' do
      expect(page).to have_content 'Dodaj pokój'
    end

    it 'adds room' do
      click_on 'Dodaj pokój'
      fill_in 'Numer pokoju', with: room.room_number + 1
      fill_in 'Numer piętra', with: 2
      fill_in 'Ilość łóżek (miejsc) w pokoju', with: 3
      fill_in 'Cena za miejsce', with: 100
      click_on 'Zapisz' 
      expect(page).to have_content '100 zł' && 'Edytuj'
    end

    it 'deletes room' do
      click_on 'x'
      expect(page).not_to have_content room.price
    end

    it 'edits room' do
      click_on 'Edytuj'
      fill_in 'Cena za miejsce', with: 200
      click_on 'Zapisz'
      expect(page).to have_content '200 zł'
    end

    it 'shows room' do
      click_on room.room_number
      expect(page).not_to have_content 'Dodaj pokój'
    end
  end
end
