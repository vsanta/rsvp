ActiveAdmin.register Invitee do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# end
  permit_params :name, :email, :group, :group_id

  form do |f|
    f.inputs do
      f.input :group_id,
              as: :search_select, url: admin_groups_path,
              fields: %i[name id],
              display_name: "name", minimum_input_length: 2,
              order_by: "id_asc"
      f.input :name, as: :string
      f.input :email, as: :email
      f.input :rsvp
      f.input :is_a_child
      f.input :age
    end
    f.actions
  end
end
