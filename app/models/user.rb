class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, foreign_key: 'user_id'
  has_many :orders, foreign_key: 'user_id'

  after_create :welcome_send

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end

end
