class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include CanCan::ControllerAdditions
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :document, :birthday, :phone, :rol])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :surname, :document, :birthday, :phone, :rol])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :document, :birthday, :phone, :rol])
    end
  end
