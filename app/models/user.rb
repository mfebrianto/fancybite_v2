class User < ActiveRecord::Base
  before_save :default_values, :assign_names

  attr_accessor :full_name
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

  def assign_names
    if @full_name.present?
      names = NameProcessor.split_name(@full_name)
      self.given_name = names[0]
      self.sure_name = names[1]
    end
  end

  def full_name
    "#{given_name} #{sure_name}"
  end
end
