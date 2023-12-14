require "../helpers/*"

def rick_and_morty_api(travel_data : TravelStop | Nil)
  travel = travel_data
  
  travels = Array(Int32).new

  travel.not_nil!.travel_stops.each do |travel_stop|
    travels << travel_stop
  end

  body = {
    "query" => %{query {
        locationsByIds(ids: #{travels}) {
          id
          name
          dimension
          type
          residents {
            episode {
              id
            }
          }
        }
      }
    }
  }.to_json

  url = "https://rickandmortyapi.com/graphql?="

  headers = HTTP::Headers{"User-Agent" => "AwesomeApp"}
  response = HTTP::Client.post(url, headers: headers, body: body)

  location = response.body

  value = ResponseData.from_json(location)
  location_api_result = value.data.locations_by_ids
  # travel_result = { id: id, travel_stops: location_api_result }
  location_api_result
end