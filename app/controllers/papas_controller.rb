class PapasController < ApplicationController

  def generate_pin
    pin = Pin.create(device_id: params[:device_id])
    render json: pin, only: [ :device_id, :pin ]
  end

end
