class AddCountryToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column :destinations, :country, :string
  end
end
