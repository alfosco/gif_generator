class CreateJoinTableForUsersGifs < ActiveRecord::Migration
  def change
    create_table :gifs_users, id: false do |t|
      t.belongs_to :gif
      t.belongs_to :user
    end
  end
end
