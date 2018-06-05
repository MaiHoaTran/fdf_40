module Authentication
  class RegistrationsController < Devise::RegistrationsController
    layout "authentication/application"
    before_action :configure_sign_up_params, only: %i(create)

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(full_name email
                                                           password password_confirmation phone address sex))
    end

    def after_sign_up_path_for _resource
      root_path
    end
  end
end
