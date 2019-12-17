class Document < ApplicationRecord
    has_attached_file :pin
    path: ":rails_root/public/files/:id/:filename",
    url: "/files/:id/:filename"
    validates_attachment_content_type :pin, content_type: ["application/pdf"]
    belongs_to :subject
    belongs_to :storage

    def upload_drive
        session = GoogleDrive::Session.from_config('config.json')
        path = "#{Rails.root}/public/files/#{id}/#{pin_file_name}"
        file = session.upload_from_file(path, "#{pin_file_name}", convert: false)
        #puts "FILE: #{file.human_url}"
        folder_id = '1RZpkauLoYRxH41FVnhdhYSghnXAbd0Rq'                                                                 
        folder = session.collection_by_id(folder_id)
        folder.add(file)
    end
end
