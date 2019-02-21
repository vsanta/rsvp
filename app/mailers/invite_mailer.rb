class InviteMailer < ApplicationMailer
  def invite
    @invitee = params[:invitee]
    @url = "#{Rails.application.credentials.invite_domain}/#{@invitee.code}"
    mail(to: "jesusmarlima@gmail.com", subject: 'O aniversario da Olivia esta chegando')
  end
end
