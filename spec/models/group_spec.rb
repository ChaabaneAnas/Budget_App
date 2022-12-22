require 'rails_helper'

RSpec.describe Group, type: :model do
  
  before(:each) do
    @user = User.new(name:"Jhon", email:"Jhon@email.com", password:"password")
    @group = Group.new(name:"Food", icon:"https://cdn-icons-png.flaticon.com/128/2276/2276931.png")
  end   

  it'should not be valid without name' do
    @user.name = nil
    expect(@group).to_not be_valid
  end 

  it'should not be valid if the name is to short' do
    @user.name = "aa"
    expect(@group).to_not be_valid
  end 

  it'should not be valid without an icon' do 
    @user.icon = nil 
    expect(@group).to_not be_valid
  end 

  it'should not be valid without an icon' do 
    @user.user = nil 
    expect(@group).to_not be_valid
  end 
end
