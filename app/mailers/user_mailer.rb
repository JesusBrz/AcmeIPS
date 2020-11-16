class UserMailer < ApplicationMailer
    default from: 'no-reply@acmeips.com'

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido")
  end
end
