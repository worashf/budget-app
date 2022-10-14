require 'rails_helper'

RSpec.describe Spending, type: :model do
  subject do
    User.create(name: 'worash', email: 'worash@gmail.com', password: '123456')
  end
  let(:spending) { Spending.create(name: 'food spending', amount: 10, author: subject) }

  it 'Should pass with all valid atributes' do
    expect(spending).to be_valid
  end
  it 'spending with out author should be invalid' do
    spending.author = nil
    expect(spending).to_not be_valid
  end
  it 'Spending with out name should be invalid' do
    spending.name = nil
    expect(spending).to_not be_valid
  end
  it 'Spending with out amount should be invalid' do
    spending.amount = nil
    expect(spending).to_not be_valid
  end
  it 'Spendind with negative amount should be invalid' do
    spending.amount = -5
    expect(spending).to_not be_valid
  end
  it 'spending with string amout should be invalid' do
    spending.amount = 's'
    expect(spending).to_not be_valid
  end
  it 'Spending amount should be equal to the given amount' do
    expect(spending.amount).to eq spending.amount
  end
end
