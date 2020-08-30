class AddTytulEnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tytul_en, :text
  end
end
