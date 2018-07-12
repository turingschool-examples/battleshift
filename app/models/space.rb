class Space < ApplicationRecord
  belongs_to :ship, optional: true
  belongs_to :board
end