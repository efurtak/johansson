class RemoveFlagiFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :do_rowerow,     :boolean
    remove_column :products, :do_zamkow,      :boolean
    remove_column :products, :mtb,                         :boolean
    remove_column :products, :szosa_i_trekking,            :boolean
    remove_column :products, :zmywacze_rowerowe,           :boolean
    remove_column :products, :spray_ochronny_do_zamkow,    :boolean
    remove_column :products, :spray_do_zamkow,             :boolean
    remove_column :products, :olejek_do_zamkow_z_teflonem, :boolean
  end
end
