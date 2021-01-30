class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :name, required: true
      t.text :address, required: true

      t.timestamps
    end
  end
end
