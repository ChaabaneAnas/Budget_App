require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  before(:each) do
    @user = User.create(name: 'arbouch', email: 'arbouch@gmail.com', password: 'password')
    @group = Group.create(user: @user, name: 'Food', icon: 'https://icon_url')
    @entity = Entity.create(user: @user, name: 'pizzHut', amount: 15)
    @group.entities << @entity
    visit new_user_session_path
    fill_in 'Email', with: 'arbouch@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_on(@group.name)
  end

  scenario 'I can see the group card.' do
    expect(page).to have_css('div.card')
  end
  scenario 'I can see the page title.' do
    expect(page).to have_content 'Transactions'
  end
  scenario 'I can see the group name.' do
    expect(page).to have_content 'pizzHut'
  end
  scenario 'I can see the group total transaction.' do
    expect(page).to have_content '15$'
  end
end
