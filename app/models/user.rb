class User < ActiveRecord::Base

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "40x40" }, default_url: '/assets/avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_format_of :username,
    with:    /\A[A-Za-z0-9]+\z/,
    message: "can only contain letters, numbers and hyphens (-)"

  has_secure_password

  validates_format_of :email,
    with:    /@/,
    message: "needs an @ sign"

  validates_uniqueness_of :username
end
