module Admin
  class ProductsController < AdminController
    rescue_from ActiveRecord::RecordNotFound do |exception|
      respond_to do |format|
        format.html{redirect_to admin_products_path, alert: exception.message}
      end
    end

    load_and_authorize_resource param_method: :product_params
    before_action :load_categories

    def index
      @products = Product.all.paginate page: params[:page], per_page: Settings.admin.number_items_per_page
    end

    def search
      information = params[:search][:information]
      cat_id = params[:search][:cat_id]
      @products = Product.search_by_name(information).by_category_id(cat_id).paginate page: params[:page], per_page: Settings.admin.number_items_per_page
      render :index
    end

    def new; end

    def create
      if Product.by_name(@product.name).blank?
        save_product @product
      else
        @message = t "admin.products.new.exist_error"
        render :new
      end
    end

    def show
      render :edit
    end

    def edit; end

    def update
      product = Product.new product_params
      if Product.by_name(product.name).by_id_not_match(@product.id).blank?
        update_product @product
      else
        @message = t "admin.products.new.exist_error"
        @product.update product_params
        render :edit
      end
    end

    def destroy
      if @product.destroy
        flash[:success] = t "admin.products.new.success_delete_msg"
      else
        flash[:danger] = t "admin.products.new.danger_delete_msg"
      end
      redirect_to admin_products_url
    end

    private

    def product_params
      params.require(:product).permit :name, :price, :image, :description, :category_id
    end

    def load_categories
      @categories = Category.all
    end

    def save_product add_product
      if add_product.save
        flash[:success] = t "admin.products.new.success_add_msg"
        redirect_to admin_products_url
      else
        render :new
      end
    end

    def update_product update_pro
      if update_pro.update product_params
        flash[:success] = t "admin.products.edit.success_edit_msg"
        redirect_to admin_products_url
      else
        render :edit
      end
    end
  end
end
