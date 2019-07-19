class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :avatar

  before_create :set_defaults

  def set_defaults
    self.avatar = 'assets/images/astronaut.svg' if self.new_record?
  end
end
