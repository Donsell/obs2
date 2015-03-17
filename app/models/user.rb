class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :telescopes,  dependent: :destroy
  has_many :eyepieces,  dependent: :destroy
  has_many :sites,  dependent: :destroy
  has_many :outings,  dependent: :destroy

end
