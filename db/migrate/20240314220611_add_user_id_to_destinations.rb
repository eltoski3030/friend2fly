class AddUserIdToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_reference :destinations, :user, null: true, foreign_key: true
  end
end
