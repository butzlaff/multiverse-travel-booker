require "../models/*"

def create(data : TravelData)
  TravelStop.create(
    travel_stops: data.travel_stops
  )
end

def find_all
  TravelStop.all
end

def find_by_id(id : Int32)
  TravelStop.find(id)
end

def update(id : Int32, data : TravelData)
  TravelStop.where { _id == id }.update(
    travel_stops: data.travel_stops
  )
  find_by_id(id)
end

def delete(id : Int32)
  TravelStop.delete(id)
end

def append_travel(id : Int32, data : TravelData)
  travel = find_by_id(id)

  unless travel
    return nil
  end

  if travel.travel_stops
    travel.travel_stops.concat(data.travel_stops)
  end

  TravelStop.where { _id == id }.update(
    travel_stops: travel.travel_stops
  )
  find_by_id(id)
end
