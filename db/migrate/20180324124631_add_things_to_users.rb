class AddThingsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :birthday, :date
    add_column :users, :avatar_url, :string
  end
end
