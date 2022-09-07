class User < ApplicationRecord
    has_many :subscriptions
    has_many :products, through: :subscriptions
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    accepts_nested_attributes_for :subscriptions
    has_secure_password
end


