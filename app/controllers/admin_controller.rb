class AdminController < ApplicationController
  layout "admin/application"

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html{redirect_to main_app.root_url, notice: exception.message}
    end
  end
end
