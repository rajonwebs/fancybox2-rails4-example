require 'rails_helper'

feature 'fancybox for new address', js: true do
  feature 'link to new address' do
    scenario 'opens fancybox form' do
      visit '/'
      click_link 'New Address'
      expect(page).to have_css('h3', text: 'New Address')
    end
  end
  feature 'add a new valid address' do
    scenario 'saves ok' do
      visit '/'
      click_link 'New Address'
      within('.modal-body') do
        fill_in 'name', with: 'Henry'
        fill_in 'street', with: '123 Main St'
        fill_in 'city', with: 'Hometown'
        fill_in 'state', with: 'State'
        fill_in 'zip', with: '12345'

        click_button 'Save'
      end
      expect(page).to have_content 'Henry'
    end
  end
  feature 'add a new invalid address' do
    scenario 'does not save' do
      visit '/'
      click_link 'New Address'
      within('.modal-body') do
        fill_in 'name', with: 'Henry'

        click_button 'Save'
      end
      expect(page).not_to have_content 'Henry'
    end
  end
end
