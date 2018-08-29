require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validations' do
    it { should validate_presence_of(:challenger_token) }
    it { should validate_presence_of(:opponent_token) }
  end

  # context 'relationships' do
  #   it { should belong_to(:user) } 
  # end
end
