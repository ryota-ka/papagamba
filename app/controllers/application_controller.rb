class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_device_id

  private

  def set_device_id
    cookies.permanent[:device_id] = SecureRandom.uuid if cookies.permanent[:device_id].blank?
    @device_id = cookies.permanent[:device_id]
  end

end
