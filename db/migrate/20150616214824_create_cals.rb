class CreateCals < ActiveRecord::Migration
  def change
    create_table :cals do |t|
      t.string :num

      t.timestamps null: false
    end
  end
end
