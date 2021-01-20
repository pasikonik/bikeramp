class WeeklyStats
  include Interactor
  include ActionView::Helpers::NumberHelper

  def call
    total_distance = trips.pluck(:distance).inject(:+) || 0
    total_price = trips.pluck(:price).inject(:+) || 0

    context.stats = {
      total_distance: "#{total_distance.round(0)}km",
      total_price: number_to_currency(total_price, unit: 'PLN', format: '%n%u')
    }
  end

  private

  def trips
    @trips ||= Trip.where(date: start_of_week..end_of_week)
  end

  def start_of_week
    DateTime.now.at_beginning_of_week
  end

  def end_of_week
    DateTime.now.end_of_week
  end
end
