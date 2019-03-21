class InviteMailer < ApplicationMailer
  def invite
    @invitee = params[:invitee]
    @url = "#{Rails.application.credentials.invite_domain}#{@invitee.code}"
    Metric.find_or_initialize_by(invitee: @invitee) do |metric|
      metric.sent = true
      metric.save
    end
    mail(to:  @invitee.email , subject: 'O aniversário da Olivia está chegando')
  end
end
