class Document < ApplicationRecord
    has_attached_file :pin,  styles: { thumbnail: "90x50#" }, default_url: "/images/:style/missing.png"

    validates_attachment_content_type :pin, content_type: "application/pdf"
    belongs_to :subject
    belongs_to :storage
end
