module Admins
  class DashboardsController < ApplicationController

    def index
      @sectors = Sector.all
      @sector = Sector.new
    end

  end
end
