module Admin
class SettingsController < AdminController

  before_action :get_setting, only: [:edit, :show, :update, :destroy]

  def index
    @settings = Setting.all
  end

  def new
    @setting = Setting.new
  end

  def edit
  end

  def create
    @setting = Setting.new(setting_params)
    
    if @setting.save
      redirect_to admin_settings_path, flash: { notice: "Setting created successfully." }
    else
      render 'new'
    end
  end

  def update
    @setting = Setting.find_by(key: params[:setting][:key])

    if @setting.update_attributes(setting_params)
      redirect_to admin_settings_path, flash: { notice: "#{@setting.human_key} saved successfully." }
    else
      redirect_to admin_settings_path, flash: { notice: "Error setting #{@setting.human_key}." }
    end
  end

  def destroy
  end

private

  def get_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    p = params.require(:setting).permit(:key, :value, :group, :type)
    p[:type]  = p[:type].upcase   if p[:type]
    p[:key]   = p[:key].downcase  if p[:key]
    p[:value] = {value: p[:value]}.to_json if p[:value]
    return p
  end

end
end
