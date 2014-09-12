class Pin < ActiveRecord::Base
  before_create :create_pin

  private

  def create_pin
    self.pin = format('%04d', SecureRandom.random_number(10000))
  end
end
