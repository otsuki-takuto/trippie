class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]
end
