class InviteesController < ApplicationController
  def index
    @invitee = Invitee.find_by(code: params[:code])
    @group = @invitee.group
    Metric.where({:invitee => @invitee}).update_all({received: true})

    if @invitee
      render "invitee"
    else
      head(:not_found)
    end
  end
end
