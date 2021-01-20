module Api
  class TripsController < ApplicationController
    def create
      result = CreateTrip.call(params: trip_params)
      if result.success?
        render json: result.trip, stauts: :created
      else
        render json: { errors: result.message }, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      params.require(:trip).permit(:start_address, :destination_address, :price, :date)
    end
  end
end
