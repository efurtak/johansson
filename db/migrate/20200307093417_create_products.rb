class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :kod
      t.text :tytul
      t.integer :kat
      t.float :subkat

      t.timestamps
    end
  end
end
