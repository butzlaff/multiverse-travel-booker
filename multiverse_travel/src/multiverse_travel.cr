# TODO: Write documentation for `MultiverseTravel`
require "../config/config"

module MultiverseTravel
  VERSION = "0.1.0"

  get "/" do |env|
    env.response.content_type = "application/json"
    {server_status: "Ok"}.to_json
  end

end

Kemal.run
