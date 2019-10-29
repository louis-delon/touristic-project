module Admins

  class SectorsController < ApplicationController

    def create
      @sector = Sector.new(params_sector)
      @sector.save!
      respond_to do |format|
        format.js
      end
        # redirect_to admins_root_path, notice: t('activerecord.attributes.sector.success')
      # else
      #   render "/admins"
      # end
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
