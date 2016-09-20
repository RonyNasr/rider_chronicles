class AddAttachmentImageUrlToBikes < ActiveRecord::Migration
  def self.up
    change_table :bikes do |t|
      t.attachment :imageURL
    end
  end

  def self.down
    remove_attachment :bikes, :imageURL
  end
end
