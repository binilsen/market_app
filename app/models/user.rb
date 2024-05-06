# frozen_string_literal: true

# App user
class User < ApplicationRecord
  TOKEN_HASH = Rails.application.credentials.secret_key_base

  before_create :generate_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relationships
  has_many :orders_products
  has_many :orders, through: :orders_products
  has_many :address
  has_many :products_users
  has_many :products, through: :products_users
  has_many :wishlists
  has_many :attachments, as: :attachable
  has_one :cart

  def token
    payload =  { ulid:, exp: (Time.zone.now + 6.hours).to_i }
    JWT.encode payload, User::TOKEN_HASH, 'hS512'
  end

  def self.find_by_token(user_token)
    decoded = JWT.decode user_token, User::TOKEN_HASH, true, { algorithm: 'HS512' }
    User.find_by_ulid(decoded[0]['ulid'])
  rescue JWT::DecodeError
    false
  end
end
