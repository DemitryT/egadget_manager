class AddAttachmentGadgetImageToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :gadget_image
    end
  end

  def self.down
    drop_attached_file :photos, :gadget_image
  end
end
