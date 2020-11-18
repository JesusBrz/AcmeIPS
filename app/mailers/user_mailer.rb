class UserMailer < ApplicationMailer
    default from: 'no-reply@acme-ips.herokuapp.com'

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido")
  end

  def goodbye(user)
    @user = user
    mail(to: user.email, subject: "Te extrañaremos")
  end

  def cita_nueva(cita)
    @cita = cita
    mail(to: cita.correo_paciente, subject: "Cita Agendada")
  end

  def cita_reprogramada(cita)
    @cita = cita
    mail(to: cita.correo_paciente, subject: "Cita Reprogramada")
  end

  def new_user_cita_nueva(cita)
    @cita = cita
    mail(to: cita.correo_paciente, subject: "Cita Agendada y Usuario Creado")
  end
  
end
