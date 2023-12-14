require "http/client"
require "json"
require "../service/travel_plans"
require "../models/*"
require "../clients/*"

BASE = "/travel_plans"

post BASE do |env|
  env.response.content_type = "application/json"

  travel_data = TravelData.from_json(env.request.body.not_nil!)

  travel = create(travel_data)

  env.response.status_code = 201
  travel.to_json(%w[id travel_stops])
end

get BASE do |env|
  env.response.content_type = "application/json"
  
  travels = find_all()

  expand = env.params.query["expand"]? || "false"
  optimize = env.params.query["optimize"]? || "false"
  
  if expand == "true" || optimize == "true" && travels.count > 0

    travel_response = travels.to_a.map do |travel|

      travels = Array(Location).new
      travels = rick_and_morty_api(travel)
      travel_resp = optimizer_expand(optimize.not_nil!, expand.not_nil!, travels.not_nil!)
      
      { id: travel.id, travel_stops: travel_resp }
    end
  env.response.status_code = 200
  travel_response.to_json
  else
    env.response.status_code = 200
    travels.to_json
  end
end

get BASE + "/:id" do |env|
  env.response.content_type = "application/json"

  id = env.params.url["id"].to_i32

  travel_data = find_by_id(id)

  expand = env.params.query["expand"]? || "false"
  optimize = env.params.query["optimize"]? || "false"

  if expand == "true" || optimize == "true"

    travels = rick_and_morty_api(travel_data)

    travel_resp = optimizer_expand(optimize.not_nil!, expand.not_nil!, travels.not_nil!)

    env.response.status_code = 200
    { id: id, travel_stops: travel_resp}.to_json
  else
    env.response.status_code = 200
    travel_data.to_json
  end
end

put BASE + "/:id" do |env|
  env.response.content_type = "application/json"

  id = env.params.url["id"].to_i32

  travel_data = TravelData.from_json(env.request.body.not_nil!)

  travel = update(id, travel_data)

  env.response.status_code = 200
  travel.to_json
end

delete BASE + "/:id" do |env|
  env.response.content_type = "application/json"

  id = env.params.url["id"].to_i32

  delete(id)

  env.response.status_code = 204
end

patch BASE + "/:id" do |env|
  env.response.content_type = "application/json"

  id = env.params.url["id"].to_i32
  travel_data = TravelData.from_json(env.request.body.not_nil!)
  travel = append_travel(id, travel_data)
  env.response.status_code = 200
  travel.to_json
end