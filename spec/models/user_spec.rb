require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject do
    User.new(name: 'Microverse', email: 'microverse23@gmail.com',
             password: 'password')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with invalid attributes' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'shoud have an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
