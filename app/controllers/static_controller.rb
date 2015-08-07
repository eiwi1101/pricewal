class StaticController < ApplicationController

    def home
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
