class AddColumnToAppointmentsTable < ActiveRecord::Migration
  def change
    add_column :appointments, :consultant_id, :integer
  end
end
