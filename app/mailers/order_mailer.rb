class OrderMailer < ApplicationMailer
  require "json"
  require "ostruct"

  def result_order user, order, order_details
    @user = JSON.parse user, object_class: OpenStruct
    @order = JSON.parse order, object_class: OpenStruct
    @order_details = JSON.parse(order_details, object_class: OrderDetail)
    mail to: @user.email, subject: "Your order"
  end
end
