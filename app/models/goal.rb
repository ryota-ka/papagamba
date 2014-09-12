class Goal < ActiveRecord::Base
  belongs_to :couple

  mount_uploader :prize, PrizeImageUploader
end
