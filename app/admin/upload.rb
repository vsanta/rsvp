require 'csv'
ActiveAdmin.register_page "Upload" do

  page_action :upload_file, method: :post do
    upload(permited_params(params))
    redirect_to admin_root_path
  end

  controller do
    def upload(parameters)
      csv_file = parameters["file_name"]
      CSV.parse(csv_file.read, :headers => true, :encoding => 'ISO-8859-1').each do |row|
        hashed_row = row.to_hash
        group = Group.find_or_initialize_by(id: hashed_row["group_id"].to_i)
        if group.new_record?
          group.name = hashed_row["name"]
          group.save
        end
        Invitee.create!(hashed_row)
      end
    end
  end

  content do
    form action: "upload/upload_file", :enctype => "multipart/form-data", method: :post do |f|
      f.input name: "authenticity_token", type: :hidden, value: form_authenticity_token.to_s
      f.input name: :file_name, type: :file
      f.input :submit, type: :submit, "data-confirm": "Are you sure?"
    end
  end
end

def permited_params(params)
  params.permit(:file_name)
end