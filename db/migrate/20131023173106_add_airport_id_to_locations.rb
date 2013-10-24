class AddAirportIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :airport_id, :integer
  end
end
