module Admin
class PagesController < AdminController

  before_action :get_page, only: [:edit, :create, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    
    if @page.save
      redirect_to admin_pages_path, flash: { notice: "Page created successfully." }
    else
      render 'new'
    end
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to admin_pages_path, flash: { notice: "Page created successfully." }
    else
      render 'edit'
    end
  end

  def destroy
  end

private

  def get_page
    @page = Page.find_by(slug: params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end

end
end
