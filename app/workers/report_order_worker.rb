class ReportOrderWorker
  include Sidekiq::Worker

  def perform current_user, order, order_details
    OrderMailer.result_order(current_user, order, order_details).deliver
  end
end
