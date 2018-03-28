class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :provider 
end
