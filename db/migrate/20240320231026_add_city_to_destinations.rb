class AddCityToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column :destinations, :city, :string
  end
end
