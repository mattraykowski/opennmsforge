class AddDeviceAndProductColumnToConfigPack < ActiveRecord::Migration
  def change
    add_column :config_packs, :vendor, :string
    add_column :config_packs, :product, :string

    ConfigPack.update_all vendor: "Please Update"
    ConfigPack.update_all product: "Please Update"
  end
end
