class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :password, :is_trainer, :phone, :image
end