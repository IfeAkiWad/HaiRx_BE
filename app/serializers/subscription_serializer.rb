class SubscriptionSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :product_id, :frequency
end