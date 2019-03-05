ActiveAdmin.register Group do
  permit_params :name



  batch_action :invite_all do |ids|
    batch_action_collection.find(ids).each do |group|
      group.invitees.each do |invitee|
        InviteMailer.with(invitee: invitee).invite.deliver_later if invitee.email
      end
    end
    redirect_to collection_path, alert: "Invite sent to #{ids.length} groups."
  end
end
