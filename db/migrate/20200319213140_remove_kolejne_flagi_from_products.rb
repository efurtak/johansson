class RemoveKolejneFlagiFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :kat,                    :integer
    remove_column :products, :subkat,                 :float
    remove_column :products, :rzadkie,                :boolean
    remove_column :products, :geste,                  :boolean
    remove_column :products, :ekstra_geste,           :boolean
    remove_column :products, :uniwersalne,            :boolean
    remove_column :products, :z_ptfe,                 :boolean
    remove_column :products, :z_mos2,                 :boolean
    remove_column :products, :z_grafitem,             :boolean
    remove_column :products, :biale,                  :boolean
    remove_column :products, :do_lozysk,              :boolean
    remove_column :products, :do_bram,                :boolean
    remove_column :products, :do_dzwigow,             :boolean
    remove_column :products, :do_lancuchow,           :boolean
    remove_column :products, :litowe,                 :boolean
    remove_column :products, :wysiegniki_alu,         :boolean
    remove_column :products, :polsuche_srodki_smarne, :boolean
    remove_column :products, :oleje_wysokoczepne,     :boolean
    remove_column :products, :smary_pelzajace,        :boolean
  end
end
