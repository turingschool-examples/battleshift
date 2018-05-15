require 'rails_helper'
module Api
  module V1
    class ShipsController < ApiController
      def create
        game = Game.find(params[:id])
        ship = Ship.new(response.body[:ship_size])
        start_space = response.body[:start_space]
        end_space = response.body[:end_space]

        ShipPlacer.new(ship, start_space, end_space)

      end
    end
  end
end
