class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :city
      t.string :country
      t.string :code
      t.text :details

      t.timestamps
    end
  end
end
