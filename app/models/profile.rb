class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
