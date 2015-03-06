class Body < ActiveRecord::Base
  belongs_to :constellation
  belongs_to :body_type
  has_many :catalogs
end
