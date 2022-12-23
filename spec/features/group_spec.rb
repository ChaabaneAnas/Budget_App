require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before(:each) do
    @user = User.create(name: 'arbouch', email: 'arbouch@gmail.com', password: 'password')
    @group = Group.create(user: @user, name: 'Food', icon: 'https://icon_url')
    visit new_user_session_path
    fill_in 'Email', with: 'arbouch@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'I can see the group card.' do
    expect(page).to have_css('div.card')
  end
  scenario 'I can see the page title.' do
    expect(page).to have_content 'Categories'
  end
  scenario 'I can see the group name.' do
    expect(page).to have_content 'Food'
  end
  scenario 'I can see the group total transaction.' do
    expect(page).to have_content 'Credit'
  end
end
