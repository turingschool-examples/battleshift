require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Relationships' do
    it {should belong_to :player_1}
  end
  describe 'Methods' do
    it 'should set the message for the game' do
      message = spy('Your shot resulted in a hit.')
      message.deliver

      expect(message).to have_received(:deliver)
    end
    # I am not sure what this is doing but I wanted to try to
    # use a spy 
  end
end
