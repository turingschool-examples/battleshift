class Board < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :spaces
  has_many :ships, through: :spaces

  def create_board
  end
end