module Admins
  class DashboardsController < ApplicationController

    def index
      @sectors = Sector.order(:position)
      @sector = Sector.new
    end

  end
end
