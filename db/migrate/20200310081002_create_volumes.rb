class CreateVolumes < ActiveRecord::Migration[6.0]
  def change
    create_table :volumes do |t|
      t.references :product, null: false, foreign_key: true
      t.string :pojemnosc
      t.decimal :cena, precision: 10, scale: 2

      t.timestamps
    end
  end
end
