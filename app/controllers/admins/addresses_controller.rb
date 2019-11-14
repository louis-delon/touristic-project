module Admins
  class AddressesController < ApplicationController

    def index
      @addresses = Address.all
    end

    def create
    end
  end
end
