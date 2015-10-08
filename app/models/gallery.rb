class Gallery < ActiveRecord::Base
  has_many :images

  def cover
    if images.empty?
      Image.new.image
    else
      images.first.image
    end
  end
end
