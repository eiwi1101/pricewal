class ArtworksController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: Image.all.collect{ |h| h.attributes.merge({image_file_path: h.image.url}) } }
    end
  end
end
