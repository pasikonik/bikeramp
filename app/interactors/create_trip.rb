class CreateTrip
  include Interactor::Organizer

  organize Trips::MeasureDistance,
           Trips::Save
end
