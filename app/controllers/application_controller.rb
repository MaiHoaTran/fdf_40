class ApplicationController < ActionController::Base
  helper_method :load_product

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
