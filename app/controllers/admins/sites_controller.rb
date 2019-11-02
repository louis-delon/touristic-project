module Admins

  class SitesController < ApplicationController

    def index
      @sites = Site.all
    end

    def create
      @sector = Sector.find(params[:sector_id])
      @site = Site.new(params_site)
      if @site.save
        redirect_to admins_sector_url(@sector), notice: "Nouvelle adresse crée avec succès"
      else
        @sites = Site.all
        @site = Site.new
        @site.build_address
        render "admins/sectors/show", status: :unprocessable_entity
      end
    end

    def sort
      params[:site].each_with_index do |id, index|
        Site.where(id: id).update_all(position: index + 1)
      end

      head :ok
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def params_site
      params.require(:site).permit(
        :title,
        :opening_time,
        :description,
        :phone_number,
        :website,
        :category,
        :picture,
        address_attributes: [
          :street,
          :city,
          :postal_code
          ]
        )
    end
  end
end
