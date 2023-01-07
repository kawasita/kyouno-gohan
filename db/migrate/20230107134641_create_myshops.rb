class CreateMyshops < ActiveRecord::Migration[6.1]
  def change
    create_table :myshops do |t|

      t.timestamps
    end
  end
end
