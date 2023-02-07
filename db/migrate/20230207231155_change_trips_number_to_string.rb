class ChangeTripsNumberToString < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :number, :string
  end
end
