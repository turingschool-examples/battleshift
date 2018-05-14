require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_confirmation_of(:password) }

  it 'should not be active by default and have an activation key' do
    user = User.new(name: 'a', email: 'b', password: '1', password_confirmation: '1')

    expect(user.activated).to be_falsey
    expect(user.activation_key).to_not be_nil
  end
end
