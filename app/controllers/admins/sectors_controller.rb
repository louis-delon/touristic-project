module Admins

  class SectorsController < ApplicationController

    def create
      @sector = Sector.new(params_sector)
      if @sector.save
        redirect_to , notice: ""
      else

      end
    end

    def edit
    end

    def update
    end

    def show
    end

    def delete
    end

    private

    def params_sector
      params.require(:sector).permit(
        :name,
        :illustration,
        :description,
        :city
      )
    end

  end
end
