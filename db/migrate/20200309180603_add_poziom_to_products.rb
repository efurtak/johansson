class AddPoziomToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :poziom, :integer
  end
end
