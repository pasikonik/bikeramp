class MonthlyStats
  include Interactor
  include ActionView::Helpers::NumberHelper

  MONTH_FORMAT = '%B, '.freeze

  def call
    days = trips_by_day.count.reject { |_, v| v.zero? }.keys
    total_distances = trips_by_day.sum(:distance)
    average_rides = trips_by_day.average(:distance)
    average_prices = trips_by_day.average(:price)

    context.stats = days.map do |day|
      {
        day: day.strftime(MONTH_FORMAT) + day.day.ordinalize,
        total_distance: "#{total_distances[day].round(0)}km",
        avg_ride: "#{average_rides[day].round(0)}km",
        avg_price: number_to_currency(average_prices[day], unit: 'PLN', format: '%n%u')
      }
    end
  end

  private

  def trips_by_day
    @trips_by_day ||= Trip.where(date: start_of_month..end_of_month)
                          .group_by_day(:date)
  end

  def start_of_month
    DateTime.now.at_beginning_of_month
  end

  def end_of_month
    DateTime.now.end_of_month
  end
end
