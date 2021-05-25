class CreateDiys < ActiveRecord::Migration[5.2]
  def change
    create_table :diys do |t|
      t.integer :customer_id
      t.integer :genre_id
      t.string :diy_name
      t.string :image_id
      t.text :explanation

      t.timestamps
    end
  end
end
