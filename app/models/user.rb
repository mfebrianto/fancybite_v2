class User < ActiveRecord::Base
  before_save :default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin customer].freeze

  def admin?
    role == ROLES[0]
  end

  def default_values
    self.role ||= 'customer'
  end
end
