require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validations' do
    it { should validate_presence_of(:player_1_token) }
    it { should validate_presence_of(:player_2_token) }
  end

  # context 'relationships' do
  #   it { should belong_to(:user) } 
  # end
end
