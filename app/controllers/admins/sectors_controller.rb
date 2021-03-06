module Admins
  class SectorsController < ApplicationController

    before_action :set_sector, only: [:show, :edit, :update, :destroy]

    def index
      @sector = Sector.new
      @q = Sector.ransack(params[:q])
      @sectors = @q.result(distinct: true).order(:position)
    end

    def create
      @sector = Sector.new(params_sector)
      if @sector.save
        respond_to do |format|
          format.html { redirect_to admins_root_path, notice: t('activerecord.attributes.sector.create.success') }
          format.js
        end
      else
        respond_to do |format|
          format.html { render "/admins" }
          format.js
        end
      end
    end

    def edit
    end

    def update
      if @sector.update(params_sector)
        redirect_to admins_root_path, notice: t('activerecord.attributes.sector.update.success')
      else
        render :edit
      end
    end

    def show
      @sites = @sector.sites
      @site = Site.new
      @site.addresses.build
    end

    def destroy
      if @sector.destroy
        respond_to do |format|
          format.html { redirect_to admins_root_path, notice: "Quartier supprimé avec succès" }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to admins_root_path, notice: "Echec de suppression, veuillez rééssayer" }
          format.js
        end
      end
    end

    private

    def set_sector
      @sector = Sector.find(params[:id])
    end

    def params_sector
      params.require(:sector).permit(
        :name,
        :illustration,
        :description,
        :city,
        :position
      )
    end

  end
end
