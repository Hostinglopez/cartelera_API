class CreateSumaries < ActiveRecord::Migration[6.1]
  def change
    create_table :sumaries do |t|
      t.text :sinopsis
      t.string :critica
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
