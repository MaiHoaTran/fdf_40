module Authentication
  class SessionsController < Devise::SessionsController
    layout "authentication/application"
    before_action :configure_sign_in_params, only: %i(create)

    private

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: %i(email password))
    end

    def after_sign_up_path_for resource
      signed_in_root_path(resource)
    end

    def after_sign_out_path_for _resource_or_scope
      new_user_session_path
    end
  end
end
