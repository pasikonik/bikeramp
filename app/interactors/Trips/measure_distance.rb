module Trips
  class MeasureDistance
    include Interactor

    delegate :params, to: :context

    def call
      distance = Geocoder::Calculations.distance_between(start.coordinates, stop.coordinates)
      context.params[:distance] = distance.round(3)
    rescue StandardError
      context.fail!(message: { addresses: ['not found'] })
    end

    private

    def start
      Geocoder.search(params[:start_address]).first
    end

    def stop
      Geocoder.search(params[:destination_address]).first
    end
  end
end
