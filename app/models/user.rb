class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def formatted_name
    "#{name} #{surname}"
  end

  after_create :send_welcome_mail
  after_destroy :send_goodbye_mail

  def send_welcome_mail
    UserMailer.welcome(self).deliver_now
    ticket = Ticket.new(user_id: self.id, qrcode: self.document)
    ticket.save
  end

  def send_goodbye_mail
    UserMailer.goodbye(self).deliver_now
  end
end
