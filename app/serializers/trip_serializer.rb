class TripSerializer
  include JSONAPI::Serializer
  attributes :year, :number, :location
end
