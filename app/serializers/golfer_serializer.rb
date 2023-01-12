class GolferSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :role
end
