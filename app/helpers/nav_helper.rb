module NavHelper

  def nav_menu(title, icon, controller, &block)
    expanded = params[:controller] == controller
    
    haml_tag :li, class: expanded ? 'active' : '' do
      haml_tag :a do
        haml_tag :i, class: "fa fa-fw fa-#{icon}"
        haml_concat title
        haml_tag :i, class: "fa fa-fw collapse-icon fa-chevron-#{expanded ? 'down' : 'right'}"
      end

      haml_tag :ul do
        block.call
      end
    end
  end

  def nav_to(title, path)
    current = current_page? path

    haml_tag :li do
      haml_tag :a, class: current ? 'active' : '', href: path do
        haml_concat title
      end
    end
  end

end
