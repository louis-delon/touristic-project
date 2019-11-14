module Admins
  class SortsController < ApplicationController

    def update
      # take the new position for each record and update them in db
      params[object].each_with_index do |id, index|
        klass.where(id: id).update_all(position: index + 1)
      end

      head :ok
    end

    private

    def klass
      key_params.camelize.constantize
    end

    def object
      key_params.to_sym
    end

    def key_params
      request.parameters.keys[0]
    end

  end
end
