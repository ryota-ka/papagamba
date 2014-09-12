class PapasController < ApplicationController

  def generate_pin
    pin = Pin.first_or_initialize(device_id: params[:device_id])

    if pin.pin.present? || pin.save
      render json: pin, only: [ :device_id, :pin ]
    else
      render json: { errors: [ :save_failed ] }
    end
  end

  def match_pin
    pin = Pin.where(pin: params[:pin]).first()
    if pin.present?
      ActiveRecord::Base.transaction do
        couple = Couple.new(
          husband: params[:device_id],
          wife: pin.device_id
        )
        couple.save
        pin.destroy
      end
      render json: pin, only: [ :device_id, :pin ]
    else
      render json: { errors: [ :pin_not_found ] }
    end
  end

  def get_couple_by_husband
    couple = Couple.where(husband: params[:device_id])
    if couple.present?
      render json: couple, only: [ :husband, :wife ]
    else
      render json: { errors: [ :couple_not_found ] }
    end
  end

  def get_couple_by_wife
    couple = Couple.where(wife: params[:device_id])
    if couple.present?
      render json: couple, only: [ :husband, :wife ]
    else
      render json: { errors: [ :couple_not_found ] }
    end
  end

  def create_goal
    couple = Couple.where(husband: params[:device_id])
    render json: { errors: [ :couple_not_found ] } && return unless couple.present?

    goal = Goal.new(
      couple_id: couple.id,
      distance: params[:distance],
      frequency: params[:frequency],
      prize: params[:prize],
      mosaic_flg: params[:mosaic_flg]
    )
    if couple.save?
      render json: goal, only: [ :distance, :frequency, :prize, :mosaic_flg ]
    else
      render json: { errors: [ :save_failed ] }
    end
  end

  def get_goal_by_couple_id
    goal = Goal.where(couple_id: params[:couple_id]).last
    if goal.present?
      render :goal, only: [ :distance, :frequency, :prize, :mosaic_flg ]
    else
      render json: { errors: [ :goal_not_found ] }
    end
  end

end
