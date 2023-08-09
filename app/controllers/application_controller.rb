class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name]) # 注目
    end
    def after_sign_out_path_for(resource)
      users_home_path # ログアウト後に遷移するpathを設定
    end
end
