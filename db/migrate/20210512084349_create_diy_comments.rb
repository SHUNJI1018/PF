class CreateDiyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :diy_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :diy_id

      t.timestamps
    end
  end
end
