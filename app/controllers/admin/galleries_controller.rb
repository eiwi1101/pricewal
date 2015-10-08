module Admin
class GalleriesController < AdminController

  before_action :get_gallery, only: [:edit, :show, :update, :destroy]

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def edit
  end

  def show
  end

  def create
    @gallery = Gallery.new(gallery_params)
    
    if @gallery.save
      redirect_to admin_galleries_path, flash: { notice: "Gallery created successfully." }
    else
      render 'new'
    end
  end

  def update
    if @gallery.update_attributes(gallery_params)
      redirect_to admin_gallery_path(@gallery), flash: { notice: "Gallery saved successfully." }
    else
      render 'edit'
    end
  end

  def destroy
    @gallery.destroy
    redirect_to admin_galleries_path, falsh: { notice: "Gallery deleted forever." }
  end

private

  def get_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

end
end
