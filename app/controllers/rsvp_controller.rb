class RsvpController < ApplicationController
  def create
    invitees_code = params[:invitee_rsvp]
    group_id = params[:group_id]

    Invitee.where(group_id: group_id).update_all(rsvp: false)
    invitees = Invitee.where(code: invitees_code)
    invitees.update_all(rsvp: true)
    Metric.where(invitee_id: invitees.all.map(&:id)).update_all(responded: true)

    render "thankyou"
  end
end
