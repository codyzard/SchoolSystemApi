class Document < ApplicationRecord
    belongs_to :subject
    belongs_to :storage
end
