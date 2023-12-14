class CreateTravelstops < Jennifer::Migration::Base
  def up
    create_table :travel_stops do |t|
      t.integer :travel_stops, {:null => false, :array => true}

    end
  end

  def down
    drop_table :travel_stops if table_exists? :travel_stops
  end
end
