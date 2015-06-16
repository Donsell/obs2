class Outing < ActiveRecord::Base
  has_many :observations, -> {order(:obs_date, :obs_time)}, dependent: :destroy
  accepts_nested_attributes_for :observations, reject_if:  proc {|attributes| attributes['body_id'].blank? }, :allow_destroy => true
  belongs_to :site
  validates :outing_date, :time_text, :site_id, :description, presence: true

    def time_text
      outing_time.try(:strftime, "%H:%M")
    end

    def time_text=(time)
      self.outing_time = Time.zone.parse(time) if time.present?
    end
end
