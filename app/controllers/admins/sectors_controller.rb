module Admins

  class SectorsController < ApplicationController

    def index
      @sectors = Sector.order(:position)
      @sector = Sector.new
    end

    def sort
      params[:sector].each_with_index do |id, index|
        Sector.where(id: id).update_all(position: index + 1)
      end

      head :ok
    end

    def create
      @sectors = Sector.order(:position)
      @sector = Sector.new(params_sector)
      if @sector.save
        respond_to do |format|
          format.html { redirect_to admins_root_path, notice: t('activerecord.attributes.sector.success') }
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
    end

    def show
    end

    def destroy
      @sector = Sector.find(params[:id])
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
