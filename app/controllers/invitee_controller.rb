class InviteeController < ApplicationController
  def index
    @invitee = Invitee.find_by(code:  params[:code])
    if @invitee
      render :invitee
    else
      render status: 404
    end


  end
end
