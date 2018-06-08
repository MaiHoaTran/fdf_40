module Admin
  module OrdersHelper
    def load_status_form
      [[I18n.t("admin.orders.index.paid"), "paid"],
       [I18n.t("admin.orders.index.ready"), "ready"],
       [I18n.t("admin.orders.index.pending"), "pending"]]
    end
  end
end
