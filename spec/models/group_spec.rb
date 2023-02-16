require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'microverse23@gmail.com',
      password: 'password'
    )

    @group = Group.create(
      name: 'Group 1',
      author_id: @user.id
    )
  end

  describe 'group#Validations' do
    it 'should be validate with valid attributes' do
      expect(@group).to be_valid
    end

    it 'should have a name attribute' do
      @group.name = nil
      expect(subject).not_to be_valid
    end
  end
end
