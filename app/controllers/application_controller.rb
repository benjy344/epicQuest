class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	before_action :configure_devise_parameters, if: :devise_controller?


  # rescue_from CanCan::AccessDenied do |exception|
  # 	redirect_to donjons_path, notify: 'Accés interdit'
  # end
  #before_filter :configure_permitted_parameters,if: :devise_controller?
	protected


	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
	end

	def configure_permitted_parameters
		added_attrs = %i( username )
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs

	end
end
