class CreateMyshops < ActiveRecord::Migration[6.1]
  def change
    create_table :myshops do |t|

      t.integer :user_id,  null: false
      t.text :shop_url, null: false
      t.string :shop_name, null: false
      t.text :shop_memo
      t.timestamps
    end
  end
end
