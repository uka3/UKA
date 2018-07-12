class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :videoble_id
      t.string :videoble_type
      t.string :video

      t.timestamps
    end
  end
end
