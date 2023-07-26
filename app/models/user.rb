class User < ApplicationRecord
    has_many :subscriptions
    has_many :products, through: :subscriptions
    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, uniqueness: true
    accepts_nested_attributes_for :subscriptions
    has_secure_password

    # def self.from_omniauth(auth)
    #     find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
    #         u.username = auth['info']['first_name']
    #         u.email = auth['info']['email']
    #         # u.name = auth['info']['name']
    #         u.password = SecureRandom.hex(15)
    #     end
    # end
end


