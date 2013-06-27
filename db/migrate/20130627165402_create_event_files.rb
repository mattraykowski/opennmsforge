class CreateEventFiles < ActiveRecord::Migration
  def change
    create_table :event_files do |t|
      t.string :name
      t.text :content
      t.references :config_pack

      t.timestamps
    end
    add_index :event_files, :config_pack_id
  end
end
