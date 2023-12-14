require "json"

class Episode
  include JSON::Serializable
  @[JSON::Field(key: "id")]
  property id : String
end

class Resident
  include JSON::Serializable
  @[JSON::Field(key: "episode")]
  property episode : Array(Episode)
end

class Location
  include JSON::Serializable

  @[JSON::Field(key: "id")]
  property id : String

  @[JSON::Field(key: "name")]
  property name : String

  @[JSON::Field(key: "type")]
  property type : String

  @[JSON::Field(key: "dimension")]
  property dimension : String

  @[JSON::Field(key: "residents")]
  property residents : Array(Resident)

  property total : Int32?
end

class Data 
  include JSON::Serializable
  @[JSON::Field(key: "locationsByIds")]
  property locations_by_ids : Array(Location)
end

class ResponseData
  include JSON::Serializable
  property data : Data
end
