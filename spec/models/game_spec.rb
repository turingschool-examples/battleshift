require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should validate_presence_of(:player_1_board) }
  it { should validate_presence_of(:player_2_board) }
  it { should have_many(:colosseums) }
  it { should have_many(:users).through(:colosseums) }
end
