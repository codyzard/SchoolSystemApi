class Storage < ApplicationRecord
    belongs_to :teacher
    has_many :documents
end
