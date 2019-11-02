module Admins

  class SitesController < ApplicationController

    def index
      @sites = Site.all
    end

    def create
      @site = Site.new(params_site)
      if @site.save
        redirect_to admins_sector(@sector), notice: "Nouvelle adresse crée avec succès"
      else
        render :new
      end
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
