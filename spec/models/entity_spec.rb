require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'microverse23@gmail.com',
      password: 'password'
    )

    @entity = Entity.create(
      name: 'Entity 1',
      amount: 100,
      author_id: @user.id
    )
  end

  describe 'entity#Validations' do
    it 'should be validate with valid attributes' do
      expect(@entity).to be_valid
    end

    it 'should have a name attribute' do
      @entity.name = nil
      expect(subject).not_to be_valid
    end

    it 'should have amount attribute' do
      @entity.amount = nil
      expect(subject).not_to be_valid
    end
  end
end
