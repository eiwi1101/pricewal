module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def page_title
    ( content_for?(:title) ? content_for(:title) + raw(" &bull; ") : "" ) + "PriceWal - An Artist Collaboration"
  end

  def md(text)
    options = {
      filter_html:         true,
      hard_wrap:           true,
      link_attributes:     { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks:  true
    }

    extensions = {
      autolink:    true,
      superscript: true,
      disable_indented_code_blocks: false
    }

    renderer    = Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)

    @markdown.render(text).html_safe
  end

end
