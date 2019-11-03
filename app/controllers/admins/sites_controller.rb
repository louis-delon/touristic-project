module Admins

  class SitesController < ApplicationController

    before_action :set_sector, only: %i(create show edit update destroy)
    before_action :set_site, only: %i(show edit update destroy)

    def index
      @addresses = Address.all
    end

    def create
      @sector = Sector.find(params[:sector_id])
      @site = Site.new(params_site)
      @site.addresses.first

      if @site.save
        redirect_to admins_sector_url(@sector), notice: "Nouvelle adresse crée avec succès"
      else
        set_render_view
        @site.addresses.build
        render "admins/sectors/show", status: :unprocessable_entity
      end
    end

    # A refactorer
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
      if @site.update(params_site)
        redirect_to admins_sector_site_path(@sector, @site)
      else
        render :edit
      end
    end

    def destroy
      if @site.destroy
        redirect_to admins_sector_path(@sector)
      else
        set_render_view
        @site.build_address
        render "admins/sectors/show", status: :unprocessable_entity
      end
    end

    private

    def set_sector
      @sector = Sector.find(params[:sector_id])
    end

    def set_site
      @site = Site.find(params[:id])
    end

    def set_render_view
      @sites = Site.all
      @site = Site.new
    end

    def params_site
      params.require(:site).permit(
        :title,
        :opening_time,
        :description,
        :phone_number,
        :website,
        :category,
        :picture,
        :position,
        addresses_attributes: [
          :street,
          :city,
          :postal_code,
          :sector_id
          ]
        )
    end
  end
end
