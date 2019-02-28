class InviteesController < ApplicationController
  def index
    @invitee = Invitee.find_by(code: params[:code])
    if @invitee
      render "invitee"
    else
      render json: {"Not Found":"404"}
    end
  end
end
