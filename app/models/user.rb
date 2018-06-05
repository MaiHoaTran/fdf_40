class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :full_name, presence: true
  validates :phone, presence: true,
    numericality: true,
    length: {minimum: Settings.admin.user.phone_min_length, maximum: Settings.admin.user.phone_max_length}
  validates :address, presence: true

  enum sex: {female: 0, male: 1}
  enum role: {user: 0, admin: 1}

  default_scope ->{order(created_at: :desc)}
end
