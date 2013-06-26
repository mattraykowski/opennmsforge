class CreateConfigPacks < ActiveRecord::Migration
  def change
    create_table :config_packs do |t|
      t.string :name
      t.text :summary
      t.text :install
      t.references :user

      t.timestamps
    end
    add_index :config_packs, :user_id
  end
end
