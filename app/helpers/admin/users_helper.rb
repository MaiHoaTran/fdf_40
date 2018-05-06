module Admin
  module UsersHelper
    def load_sex sex_user
      if sex_user
        I18n.t "admin.users.form.male"
      else
        I18n.t "admin.users.form.female"
      end
    end

    def load_role_form
      [[I18n.t("admin.users.index.admin"), 1], [I18n.t("admin.users.index.user"), 0]]
    end

    def load_role_name role_user
      if role_user == Settings.admin.user.role_admin
        I18n.t "admin.users.index.admin"
      else
        I18n.t "admin.users.index.user"
      end
    end
  end
end
