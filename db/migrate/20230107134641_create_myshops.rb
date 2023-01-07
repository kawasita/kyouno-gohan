class CreateMyshops < ActiveRecord::Migration[6.1]
  def change
    create_table :myshops do |t|
      
      t.integer :user_id,  null: false
      t.integer :shop_url, null: false
      t.string :shop_name, null: false
      t.timestamps
    end
  end
end
