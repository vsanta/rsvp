class RsvpController < ApplicationController
  def create
    going = []
    invitees_group = rsvp_params.values[0]

    invitees_group.keys.each do |invitee_id|
      invitee = Invitee.find(invitee_id)
      going << invitee_id if invitees_group[invitee_id]["rsvp"] == "true"
      invitee.update(invitees_group[invitee_id])
      Metric.where(invitee_id:invitee.id).update_all(responded: true) unless invitee.rsvp.nil?
    end

    if going.empty?
      render "we_will_miss_you"
    else
      render "thankyou"
    end
  end

  def rsvp_params
    params.require(:group).permit(invitee:[:rsvp,:age])
  end
end

