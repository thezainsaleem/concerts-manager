class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.datetime :date, required: true
      t.references :artist, foreign_key: true, index: true, required: true
      t.references :locality, foreign_key: true, index: true, required: true

      t.timestamps
    end
  end
end
