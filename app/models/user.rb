class User < ActiveRecord::Base
  validates_format_of :username,
    with:    /[A-Za-z0-9]/,
    message: "can only contain letters, numbers and hyphens (-)."

  has_secure_password

  validates_format_of :email,
    with:    /@/,
    message: "needs an at sign."

  validates_uniqueness_of :username
end
