class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :titulo
      t.time :fecha_lanzamiento

      t.timestamps
    end
  end
end
