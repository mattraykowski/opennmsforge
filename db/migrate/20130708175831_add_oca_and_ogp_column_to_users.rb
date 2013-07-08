class AddOcaAndOgpColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oca, :boolean, default: false
    add_column :users, :ogp, :boolean, default: false
  end
end
