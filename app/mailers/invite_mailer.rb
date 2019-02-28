class InviteMailer < ApplicationMailer
  def invite
    @invitee = params[:invitee]
    @url = "#{Rails.application.credentials.invite_domain}/#{@invitee.code}"
    Metric.create(invitee: @invitee, sent: true)
    mail(to:  @invitee.email , subject: 'O aniversario da Olivia esta chegando')
  end
end
