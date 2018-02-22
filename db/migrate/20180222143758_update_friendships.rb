class UpdateFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :status_temp, :integer, index: true
    HasFriendship::Friendship.where(status: 'pending').update_all(status_temp: 0)
    HasFriendship::Friendship.where(status: 'requested').update_all(status_temp: 1)
    HasFriendship::Friendship.where(status: 'accepted').update_all(status_temp: 2)
    HasFriendship::Friendship.where(status: 'blocked').update_all(status_temp: 3)
    remove_column :friendships, :status
    rename_column :friendships, :status_temp, :status
  end
end
