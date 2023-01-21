class CourseSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :city, :state, :zipcode
end
