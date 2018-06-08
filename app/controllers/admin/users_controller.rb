module Admin
  class UsersController < AdminController
    rescue_from ActiveRecord::RecordNotFound do |exception|
      respond_to do |format|
        format.html{redirect_to admin_users_path, alert: exception.message}
      end
    end
    load_and_authorize_resource param_method: :user_params

    def index
      @users = User.all.paginate(page: params[:page], per_page: Settings.admin.number_items_per_page)
    end

    def new
      @user = User.new
    end

    def show
      render :edit
    end

    def create
      if @user.save
        flash[:success] = t "admin.users.new.success_add_msg"
        redirect_to admin_users_url
      else
        render :new
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = t "admin.users.new.success_delete_msg"
      else
        flash[:danger] = t "admin.users.new.danger_delete_msg"
      end
      redirect_to admin_users_url
    end

    def edit; end

    def update
      if @user.update user_params
        flash[:success] = t "admin.users.edit.success_edit_msg"
        redirect_to admin_user_url(@user)
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password,
        :password_confirmation, :phone, :address, :sex)
    end
  end
end
