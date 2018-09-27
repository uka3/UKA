class CreateEvils < ActiveRecord::Migration[5.0]
  def change
    create_table :evils do |t|
      t.integer :post_id, null: false#, foreign_key: true
      t.integer :user_id, null: false#, foreign_key: true

      t.timestamps
    end
  end
end
