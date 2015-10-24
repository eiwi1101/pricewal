module Admin
class StaticController < AdminController

  def home
  end
  def todo
  end
  def notfound
    render :status => 404
  end
  def about
  end

end
end
