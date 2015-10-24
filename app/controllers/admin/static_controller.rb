module Admin
class StaticController < AdminController

  def home
  end
  def todo
  end
  def notfound
    render :status => 404
  end

end
end
