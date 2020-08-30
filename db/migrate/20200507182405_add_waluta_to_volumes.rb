class AddWalutaToVolumes < ActiveRecord::Migration[6.0]
  def change
    add_column :volumes, :waluta, :string
  end
end
