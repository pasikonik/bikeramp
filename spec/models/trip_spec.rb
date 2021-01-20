require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject(:trip) do
    described_class.new(start_address: 'Bujwida 18, Wroclaw, Polska',
                        destination_address: 'Zeromskiego 53, Wrcolaw, Polska',
                        distance: 10,
                        price: 24.50,
                        date: DateTime.now)
  end

  it 'is valid with valid attributes' do
    expect(trip).to be_valid
  end

  it 'is not valid without addresses' do
    trip.start_address = nil
    trip.destination_address = nil

    expect(trip).not_to be_valid
  end

  it 'is not valid without distance' do
    trip.distance = nil

    expect(trip).not_to be_valid
  end

  it 'is not valid without price' do
    trip.price = nil

    expect(trip).not_to be_valid
  end

  it 'is not valid without date' do
    trip.date = nil

    expect(trip).not_to be_valid
  end
end
