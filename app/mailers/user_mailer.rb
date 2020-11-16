class UserMailer < ApplicationMailer
    default from: 'no-reply@acme-ips.herokuapp.com'

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido")
  end
end
