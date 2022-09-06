class User < ApplicationRecord
    has_many :subscriptions
    has_many :products, through: :subscriptions
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_secure_password
end
