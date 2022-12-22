require 'rails_helper'

RSpec.describe Entity, type: :model do

  before(:each) do
    @user = User.new(name:"Jhon", email:"Jhon@email.com", password:"password")
    @entity = Entity.new(name:"pizzHut", amount:"15", user:@user)
  end 

  it'should not be valid without a name' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end 

  it'should not be valid without a amount' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end 

  it'should not be valid without a user' do
    @entity.user = nil
    expect(@entity).to_not be_valid
  end 
end
