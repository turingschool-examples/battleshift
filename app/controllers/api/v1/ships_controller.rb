class Api::V1::ShipsController < ApiController
    def create
      
      ShipPlacer.new(ship_params)
    end

      # def ship_params
      # {
      #   board: current_board
      #   ship: Ship.new(response.body[:ship_size])
      #   start_space: response.body[:start_space]
      #   end_space: response.body[:end_space]
      # }
      # end
end
