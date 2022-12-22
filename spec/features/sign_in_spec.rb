require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  before(:each) do
    User.create(name: 'arbouch', email: 'arbouch@gmail.com', password: 'password')
    visit new_user_session_path
  end
 
    scenario 'Login page has the username and password inputs and the Submit button.' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end

    scenario 'user logs in' do
      fill_in 'Email', with: 'arbouch@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Categories'
    end

    scenario 'invalid user data redirect to sign in' do
      fill_in 'Email', with: 'notarbouch@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(current_path).to eq '/users/sign_in'
    end
end
