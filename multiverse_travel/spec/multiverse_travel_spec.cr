require "./spec_helper"
require "http/client"

describe MultiverseTravel do
  resp = { "server_status": "Ok" }.to_json
  it "renders /" do
    get "/"
      response.body.should eq resp
  end

  it "create travel" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)

    travel = {
      id: res["id"],
      travel_stops: [
        1, 2
      ]
    }
    
    response.status_code.should eq 201
    response.body.should eq(travel.to_json)

    deleted_resp = delete("/travel_plans/#{res["id"]}")

    response.status_code.should eq 204
  end

  it "get all travels sucessful" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    travel = [{
      id: res["id"],
      travel_stops: [
        1, 2
      ]
    }]
    get("/travel_plans")
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)
  end

  it "get all travels expanded" do

    value = get("/travel_plans?expand=true")
    res = parse_body(value)
    travel = [{
        id: res[0]["id"],
        travel_stops: [
          {
            id: 1,
            name: "Earth (C-137)",
            type: "Planet",
            dimension: "Dimension C-137"
          },
          {
            id: 2,
            name: "Abadango",
            type: "Cluster",
            dimension: "unknown"
          }
        ]
      }]
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)
  end

  it "get all travels optimized" do

    value = get("/travel_plans?optimize=true")
    res = parse_body(value)
    travel = [{
        id: res[0]["id"],
        travel_stops: [2, 1]
      }]
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)
  end

  it "get all travels optimized and expanded" do
    value = get("/travel_plans?expand=true&optimize=true")
    res = parse_body(value)
    travel = [{
      id: res[0]["id"],
      travel_stops: [
        {
          id: 2,
          name: "Abadango",
          type: "Cluster",
          dimension: "unknown"
        },
        {
          id: 1,
          name: "Earth (C-137)",
          type: "Planet",
          dimension: "Dimension C-137"
        }
      ]
    }]

    response.status_code.should eq 200
    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res[0]["id"]}")

    response.status_code.should eq 204
  end

  it "get a travel when ID is specified" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    travel = {
      id: res["id"],
      travel_stops: [
        1, 2
      ]
    }
    get("/travel_plans/#{res["id"]}")
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end

  it "get a travel expanded when ID is specified" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    travel = {
      id: res["id"],
      travel_stops: [
        1, 2
      ]
    }
    
    res = parse_body(value)
    travel = {
        id: res["id"],
        travel_stops: [
          {
            id: 1,
            name: "Earth (C-137)",
            type: "Planet",
            dimension: "Dimension C-137"
          },
          {
            id: 2,
            name: "Abadango",
            type: "Cluster",
            dimension: "unknown"
          }
        ]
      }
    get("/travel_plans/#{res["id"]}?expand=true")
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end

  it "get a travel optimized when ID is specified" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    travel = {
        id: res["id"],
        travel_stops: [2, 1]
      }
    get("/travel_plans/#{res["id"]}?optimize=true")
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end

  it "get a travel optimized and expanded when ID is specified" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    travel = {
      id: res["id"],
      travel_stops: [
        {
          id: 2,
          name: "Abadango",
          type: "Cluster",
          dimension: "unknown"
        },
        {
          id: 1,
          name: "Earth (C-137)",
          type: "Planet",
          dimension: "Dimension C-137"
        }
      ]
    }
    get("/travel_plans/#{res["id"]}?expand=true&optimize=true")
    response.status_code.should eq 200
    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end
  it "update a travel sucessful" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    update = {
      travel_stops: [
        1, 2, 4, 5
      ]
    }
    travel = {
      id: res["id"],
      travel_stops: [
        1, 2, 4, 5
      ]
    }

    put("/travel_plans/#{res["id"]}", headers: HEADERS, body: update.to_json)

    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end

  it "update a travel sucessful" do
    json_body = { "travel_stops": [1, 2] }
    value = post("/travel_plans", headers: HEADERS, body: json_body.to_json)
    res = parse_body(value)
    update = {
      travel_stops: [
        4, 5
      ]
    }
    travel = {
      id: res["id"],
      travel_stops: [
        1, 2, 4, 5
      ]
    }

    patch("/travel_plans/#{res["id"]}", headers: HEADERS, body: update.to_json)

    response.body.should eq(travel.to_json)

    delete("/travel_plans/#{res["id"]}")
  end
end