class AddUrlToMovie < ActiveRecord::Migration[5.2]
  def change
   add_column :movies, :url, :text

  end
end
