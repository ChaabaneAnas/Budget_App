require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @group = User.new(name: 'Jhon', email: 'Jhon@email.com', password: 'password')
    @group = Group.new(name: 'Food', icon: 'https://cdn-icons-png.flaticon.com/128/2276/2276931.png')
  end

  it 'should not be valid without name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'should not be valid if the name is to short' do
    @group.name = 'aa'
    expect(@group).to_not be_valid
  end

  it 'should not be valid without an icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'should not be valid without an icon' do
    @group.user = nil
    expect(@group).to_not be_valid
  end
end
