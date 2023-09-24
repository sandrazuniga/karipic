class ApplicationController < ActionController::Base

       
    before_action :configure_permitted_parameters, if: :devise_controller?
 protected
 def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
 devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
 end


 def authorize_request(kind = nil)
     unless kind.include?(current_user.role)
         redirect_to posts_path, notice: "No estás autorizado para realizar esta acción"
     end
 end

 def after_sign_in_path_for(resource)
    posts_path
 end

end