class AddTytulSeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tytul_se, :text
  end
end
