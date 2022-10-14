require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  before :each do
    user = User.create(name: 'worash', email: 'worash@gamil.com', password: '123456')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  context 'before adding any  category' do
    it 'Should display categores(0), No categories added yet and All category total spendings 0 ' do
      expect(page).to have_content('Categories(0)')
      expect(page).to have_content('No categories added yet')
      expect(page).to have_content('All category total spendings 0')
    end
  end

  context 'After adding some category' do
    it 'Page should have category name' do
      visit new_category_path
      fill_in 'Name', with: 'Cloth'
      fill_in 'Icon', with: 'Cloth_icon_url'
      click_button 'Save'
      expect(page).to have_content('Cloth')
    end

    it 'page should  navigate to category page and before adding spendings' do
      visit new_category_path
      fill_in 'Name', with: 'Cloth'
      fill_in 'Icon', with: 'Cloth_icon_url'
      click_button 'Save'
      click_link 'Cloth'
      expect(page).to have_content('CLOTH SPENDINGS')
      expect(page).to have_content('Cloth total spendings(0)')
      expect(page).to have_content('No spending added yet for this category')
    end
  end
end
