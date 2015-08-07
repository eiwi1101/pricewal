class User < ActiveRecord::Base
  validates_format_of :username,
    with:    /\A[A-Za-z0-9]+\z/,
    message: "can only contain letters, numbers and hyphens (-)"

  has_secure_password

  validates_format_of :email,
    with:    /@/,
    message: "needs an @ sign"

  validates_uniqueness_of :username
end
