class AddColumnNameToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :name, :string
  end
end
