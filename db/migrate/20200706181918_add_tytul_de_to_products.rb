class AddTytulDeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tytul_de, :text
  end
end
