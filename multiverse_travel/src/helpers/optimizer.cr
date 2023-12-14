def optimizer(data : Array(Location))
  arr_aux = Array(Location).new
  
  data_sorted = data.sort_by { |loc| loc.residents.flat_map { |r| r.episode.size }.sum }

  set_dimension = Set(String).new
  data_sorted.each do |location|
    set_dimension << location.dimension
  end
  
  set_dimension.to_a.each do |dimension|
    data_sorted.each do |location|
      if location.dimension == dimension
        arr_aux << location
      end
    end
  end

  arr_aux
end

def optimizer_expand(optimize, expand , data : Array(Location))

  travel_aux = Array(Location).new
  if optimize == "true"
    travel_aux = optimizer(data)
  else
    travel_aux = data
  end
  if expand == "true"
    travel_expanded = travel_aux.map do |loc| 
        {
          id: loc.id.to_i,
          name:loc.name,
          type: loc.type,
          dimension: loc.dimension,
        }
    end

    travel_expanded
  else
    travel_expanded = travel_aux.map do |loc| 
      loc.id.to_i
    end
    travel_expanded
  end
end
