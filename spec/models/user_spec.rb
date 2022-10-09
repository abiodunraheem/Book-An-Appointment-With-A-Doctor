require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(username: 'john Doe', email: 'john@test.com')
    expect(user).to be_valid
  end

  it 'is not valid without a username' do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end
end
