require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.create(name: 'worash', email: 'worash@gmail.com', password: '123456')
    Category.new(name: 'food', icon: 'icon url', user:)
  end
  before { subject.save }

  it 'Category should have user' do
    subject.user = nil
    expect(subject).to be_invalid
  end

  it 'category should be an instance of Categry' do
    expect(subject).to be_instance_of(Category)
  end

  it 'Categotry name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Category icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
