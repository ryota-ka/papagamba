class PapasController < ApplicationController

  def generate_pin
    pin = Pin.create(device_id: params[:device_id])
    render json: pin, only: [ :device_id, :pin ]
  end

  def match_pin
    pin = Pin.where(pin: params[:pin]).first()
    if pin.present?
      ActiveRecord::Base.transaction do
        couple = Couple.new(
          husband: params[:device_id],
          wife: pin.device_id
        )
        couple.save!
        pin.destroy
      end
      render json: pin, only: [ :device_id, :pin ]
    else
      render json: { errors: [ :pin_not_found ] }
    end
  end

end
