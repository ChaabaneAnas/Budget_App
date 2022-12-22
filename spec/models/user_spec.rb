require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name:"Jhon", email:"Jhon@email.com", password:"password")
  end 

  it'should not be valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end 

  it'should not be valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end 

  it'should not be valid with an existing email' do 
    @user.save!
    @user1 = User.new(name:"leila", email:"Jhon@email.com", password:"password")
    expect(@user1).to_not be_valid
  end 

  it'should not be valid without a password' do
    @user.password = nil 
    expect(@user).to_not be_valid
  end 

end
