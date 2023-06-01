class AddNameToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :name, :string
  end
end
