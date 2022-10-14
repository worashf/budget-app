require 'rails_helper'

RSpec.describe 'Spending', type: :feature do
  before :each do
    user = User.create(name: 'worash', email: 'worash@gamil.com', password: '123456')
    Category.create(name: 'Food', icon: 'cat_icon_url', user:)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  it 'Before adding any spending all spending total should be 0' do
    visit root_path
    expect(page).to have_content('All category total spendings 0')
  end
  it 'after adding spending all category spending total should be the sum' do
    visit category_path(Category.first)
    click_link 'New Spending'
    fill_in 'Name', with: 'Burger'
    fill_in 'Amount', with: 20

    click_button 'Save'
    expect(page).to have_current_path(spendings_path)
  end
end
