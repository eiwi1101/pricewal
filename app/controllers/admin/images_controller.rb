module Admin
class ImagesController < AdminController

  before_action :get_image,   only: [:edit, :show, :update, :destroy]
  before_action :get_gallery, only: [:new, :create, :edit, :show, :update]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def show
  end

  def create
    @image = Image.new(image_params)

    if @image.name.nil?
      @image.name = File.basename(@image.attributes['image_file_name'], '.*').humanize
    end
    
    if @image.save
      respond_to do |format|
        format.html {
          redirect_to admin_gallery_path(params[:gallery_id]), flash: { notice: "Image created successfully." }
        }
        format.json {
          render json: { status: 'OK', files: [ @image.attributes.merge({image_file_path: @image.image.url}) ] }
        }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: { status: 'Error', error: nil } }
      end
    end
  end

  def update
    if @image.update_attributes(image_params)
      redirect_to admin_gallery_path(params[:gallery_id]), flash: { notice: "Image saved successfully." }
    else
      render 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to admin_gallery_path(params[:gallery_id]), flash: { notice: "Image deleted forever." }
  end

private
  
  def get_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def get_image
    @image   = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :description, :image, :gallery_id, :images)
  end

end
end
