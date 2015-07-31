module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def page_title
    ( content_for?(:title) ? content_for(:title) + raw(" &bull; ") : "" ) + "PriceWal - An Artist Collaboration"
  end

end
