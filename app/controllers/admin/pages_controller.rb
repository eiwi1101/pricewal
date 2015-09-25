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
  end

  def update
  end

  def destroy
  end

private

  def get_page
    @page = Page.find_by(slug: params[:id])

  end

end
end
