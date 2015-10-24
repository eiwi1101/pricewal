module NavHelper

  def nav_menu(title, icon, controller, notifications=0, &block)
    expanded = params[:controller] == controller
    
    haml_tag :li, class: expanded ? 'active' : '' do
      haml_tag :a do
        haml_tag :i, class: "fa fa-fw fa-#{icon}"
        haml_concat title

        if notifications > 0
          haml_tag :span, class: :notifications do
            haml_concat notifications
          end
        end

        haml_tag :i, class: "fa fa-fw collapse-icon fa-chevron-#{expanded ? 'down' : 'right'}"
      end

      haml_tag :ul do
        block.call
      end
    end
  end

  def nav_to(title, path, icon = nil)
    current = current_page? path

    haml_tag :li do
      haml_tag :a, class: current ? 'active' : '', href: path do
        unless icon.nil?
          haml_tag :i, class: "fa fa-fw fa-#{icon}"
        end

        haml_concat title
      end
    end
  end

end
