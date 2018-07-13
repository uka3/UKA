class AddScriptToPost < ActiveRecord::Migration[5.2]
  def change
   add_column :posts, :script, :text
   add_column :posts, :user_id, :integer
   remove_column :posts, :video, :string
  end

end
