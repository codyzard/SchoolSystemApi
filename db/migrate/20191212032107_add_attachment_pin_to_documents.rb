class AddAttachmentPinToDocuments < ActiveRecord::Migration[5.2]
  def self.up
    change_table :documents do |t|
      t.attachment :pin
    end
  end

  def self.down
    remove_attachment :documents, :pin
  end
end
