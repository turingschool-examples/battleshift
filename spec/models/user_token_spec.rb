require 'rails_helper'

RSpec.describe UserToken, type: :model do
  context 'validations' do
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :token}
    it {should validate_uniqueness_of :user_id}
    it {should validate_uniqueness_of :token}
  end
end
