class SubscriptionSerializer < ActiveModel::Serializer
    attributes :id, :name, :brand, :product_type
end