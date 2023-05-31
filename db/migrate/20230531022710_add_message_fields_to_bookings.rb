class AddMessageFieldsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :message_customer, :string
    add_column :bookings, :message_owner, :string
  end
end
