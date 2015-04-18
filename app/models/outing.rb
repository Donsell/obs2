class Outing < ActiveRecord::Base
  has_many :observations, -> {order(:obs_date, :obs_time)}, dependent: :destroy
  accepts_nested_attributes_for :observations, reject_if:  proc {|attributes| attributes['body_id'].blank? }, :allow_destroy => true
  belongs_to :site
end
