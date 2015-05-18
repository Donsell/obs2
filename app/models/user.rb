class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :telescopes,  dependent: :destroy
  has_many :eyepieces,  dependent: :destroy
  has_many :sites,  dependent: :destroy
  has_many :outings,  dependent: :destroy
  has_many :observations, dependent: :destroy
  has_many :filters, dependent: :destroy
  has_many :program_observations, dependent: :destroy
  serialize :sites_obs
  serialize :prog_obs
  before_create :create_stat

  def create_stat
    self.sites_obs = Hash.new
    self.prog_obs = Hash.new
    self.obs = 0
  end
 end
