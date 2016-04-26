class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
