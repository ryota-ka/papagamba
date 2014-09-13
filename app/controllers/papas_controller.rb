class PapasController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [ :generate_pin, :match_pin ]

  def index
  end

  def w_top
  end

  def h_top
  end

  def w_1
    @goal = Goal.new
  end

  def w_2
    couple = Couple.find_by(wife: @device_id)
    @goal = Goal.where(couple_id: couple.id).last
  end

  def h_1
    couple = Couple.find_by(husband: @device_id)
    @goal = Goal.where(couple_id: couple.id).last
  end

  def h_2
  end

  def h_3
  end

  def h_4
  end

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
    couple = Couple.find_by(wife: @device_id)

    @goal = Goal.new(
      couple_id: couple.id,
      distance: goal_params[:distance],
      frequency: goal_params[:frequency],
      prize: goal_params[:prize],
      mosaic_flg: goal_params[:mosaic_flg]
    )
    if @goal.save
      redirect_to action: :w_2
    else
      render :w_1
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

  def start_running
    couple = Couple.find_by(husband: @device_id)
    log = Log.new(
      couple_id: couple.id,
      distance: 0,
      starts_at: DateTime.now
    )
    if log.save
      redirect_to action: :h_2
    else
      redirect_to action: :h_1
    end
  end

  def stop_running
    couple = Couple.find_by(husband: @device_id)
    log = Log.where(couple_id: couple.id).last
    log.ends_at = DateTime.now
    log.distance = (log.ends_at - log.starts_at) * (10000 / 3600.0)
    if log.save
      redirect_to action: :h_3
    else
      redirect_to action: :h_2
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:distance, :frequency, :prize, :mosaic_flg)
  end

end
