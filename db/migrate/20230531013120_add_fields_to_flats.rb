class AddFieldsToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :wifi, :boolean
    add_column :flats, :TV, :boolean
    add_column :flats, :parking, :boolean
    add_column :flats, :air_conditioner, :boolean
  end
end
