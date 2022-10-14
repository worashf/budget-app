require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'worash', email: 'worash@gmail.com', password: '123456')
  end

  it 'User should be kind of user' do
    expect(subject).to be_instance_of User
  end
  it 'User with out name should not valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'User without email should be invalid' do
    subject.email = nil
    expect(subject).to be_invalid
  end
end
