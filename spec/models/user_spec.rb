require 'rails_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:status) }

    it { should validate_confirmation_of(:password) }
  end
  
  context 'relationships' do
    it { should have_many(:games) } 
  end
end