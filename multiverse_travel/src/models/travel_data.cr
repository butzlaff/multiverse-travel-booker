require "jennifer_twin"
require "json"
require "./travel_stop"

class TravelData
  include JenniferTwin
  include JSON::Serializable

  map_fields(TravelStop)
end
