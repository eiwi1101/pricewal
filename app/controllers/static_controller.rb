class StaticController < ApplicationController

    # Will redirect if Setting.landing_page is available.
    def home
      landing_page = Setting.landing_page rescue nil
      if landing_page and !landing_page.empty? and landing_page != "/"
        redirect_to landing_page
      end
    end

    def markdown
    end

    # Catches all dynamically added pages.
    # This is the final route glob, and should handle the 404 message.
    #
    def page
      @page = Page.find_by(slug: params[:page])

      if @page.nil?
        render '404', status: 404
        return
      end
    end

end
