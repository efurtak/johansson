class AddTytulRuToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tytul_ru, :text
  end
end
