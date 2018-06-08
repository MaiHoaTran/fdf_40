class ApplicationController < ActionController::Base
  helper_method :load_product

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html{redirect_to root_url, notice: exception.message}
      format.js{head :forbidden, content_type: "text/html"}
    end
  end

  def load_product product_id
    Product.find_by id: product_id
  end

  private

  def admin_user
    return if admin_user?
    flash[:danger] = t "admin.users.index.not_admin"
    redirect_to admin_users_url
  end
end
