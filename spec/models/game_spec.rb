require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Relationships' do
    it {should belong_to :player_1}
  end
end
