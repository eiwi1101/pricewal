class Page < ActiveRecord::Base
  validates_uniqueness_of :slug,
    case_sensitive: false

  validates_format_of :slug,
    with:    /\A[A-Za-z0-9\-]+\z/,
    message: "can only contain letters, numbers and hyphens (-)"

  # Enforce Lowercase Slugs
  def slug=(value)
    write_attribute(:slug, value.downcase)
  end
end
