class Photo < ActiveRecord::Base
  belongs_to :gadget
  attr_accessible :gadget_id, :gadget_image

  has_attached_file :gadget_image,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :gadget_image, content_type: ['image/jpeg', 'image/png']
end
