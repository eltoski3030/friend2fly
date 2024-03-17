class AddDetailsToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column :destinations, :budget, :decimal
    add_column :destinations, :date, :date
    add_column :destinations, :duration, :integer
  end
end
