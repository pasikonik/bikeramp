module Api
  class StatsController < ApplicationController
    def weekly
      result = WeeklyStats.call
      render json: result.stats, status: :ok
    end

    def monthly
      result = MonthlyStats.call
      render json: result.stats, status: :ok
    end
  end
end
