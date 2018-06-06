module Public
  class OrdersController < ApplicationController
    layout "public/application"

    before_action :authenticate_user!

    def create
      status = 0
      Order.transaction do
        Order.create!(user_id: current_user.id, date_order: Time.zone.today, total_price: session[:total])
        order = Order.by_user_and_get_first current_user.id
        session[:order_items].each do |row|
          OrderDetail.transaction do
            product = Product.find_by id: row[1]
            order_detail = OrderDetail.new product_id: row[1], quantity: row[0], order_id: order.id, price: product.price
            order_detail.save
          end
        end
        session[:total] = 0
        session[:order_items] = []
        order_details = OrderDetail.by_order_id order.id
        OrderMailer.result_order(current_user, order, order_details).deliver_now
        flash[:success] = t "public.orders.success"
        status = 1
      end
      flash[:danger] = t "public.orders.fail" if @status == 0
      redirect_to public_cart_path
    end
  end
end
