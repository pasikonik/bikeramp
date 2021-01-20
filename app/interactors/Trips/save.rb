module Trips
  class Save
    include Interactor

    delegate :params, to: :context

    def call
      trip = Trip.new(params)

      if trip.save
        context.trip = trip
      else
        context.fail!(message: trip.errors)
      end
    end
  end
end
