class RemoveFriendshipToFriendship < ActiveRecord::Migration[5.1]
  def change
    drop_table :friendships
    drop_table :friend_requests
  end
end
