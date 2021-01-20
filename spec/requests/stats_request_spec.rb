require 'rails_helper'

RSpec.describe 'Stats', type: :request do
  describe 'GET /stats/weekly' do
    before do
      create(:trip, distance: 15.5, price: BigDecimal('15.15'))
      create(:trip, distance: 12.75, price: BigDecimal('10.50'))

      get '/api/stats/weekly'
    end

    let(:expected_result) do
      {
        total_distance: '28km',
        total_price: '25.65PLN'
      }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns proper stats' do
      expect(response.body).to eq(expected_result.to_json)
    end
  end

  describe 'GET /stats/monthly' do
    let(:second_day_of_month) { DateTime.now.at_beginning_of_month + 2.days }
    let(:expected_result) do
      [
        {
          day: "#{second_day_of_month.strftime('%B')}, 2nd",
          total_distance: '16km',
          avg_ride: '16km',
          avg_price: '15.15PLN'
        },
        {
          day: "#{seventh_day_of_month.strftime('%B')}, 7th",
          total_distance: '38km',
          avg_ride: '19km',
          avg_price: '15.00PLN'
        }
      ]
    end
    let(:seventh_day_of_month) { DateTime.now.at_beginning_of_month + 7.days }

    before do
      create(:trip, distance: 15.50, price: BigDecimal('15.15'), date: second_day_of_month)
      create(:trip, distance: 24.20, price: BigDecimal('17.50'), date: seventh_day_of_month)
      create(:trip, distance: 14.00, price: BigDecimal('12.50'), date: seventh_day_of_month)

      get '/api/stats/monthly'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns proper stats' do
      expect(response.body).to eq(expected_result.to_json)
    end
  end
end
