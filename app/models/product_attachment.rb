class ProductAttachment < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ProductAttacmentUploader
end
