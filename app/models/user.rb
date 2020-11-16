class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def formatted_name
    "#{name} #{surname}"
  end

  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome(self).deliver_now
  end
end
