class RenameNameToCityInDestinations < ActiveRecord::Migration[7.1]
  def change
    rename_column :destinations, :name, :city
  end
end
