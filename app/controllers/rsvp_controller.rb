class RsvpController < ApplicationController
  def create
    invitees_group = rsvp_params.values[0]
    invitees_group.keys.each do |key|
      invitee = Invitee.find(key)
      invitee.update(invitees_group[key])
      Metric.where(invitee_id:invitee.id).update_all(responded: true) unless invitee.rsvp.nil?
    end
    render "thankyou"
  end

  def rsvp_params
    params.require(:group).permit(invitee:[:rsvp,:age])
  end
end

