class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user

  scope :by_user, ->(user_id){where user_id: user_id}
  scope :by_user_and_get_first, ->(user_id){where(user_id: user_id).first}

  default_scope ->{order(created_at: :desc)}
  enum status: {paid: 2, ready: 1, pending: 0}
end
