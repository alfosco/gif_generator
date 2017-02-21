class CreateGif < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :title
      t.string :image_path
    end
  end
end
