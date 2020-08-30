class AddFlagiToProducts < ActiveRecord::Migration[6.0]
  def change
    #
    # druga kolumna
    add_column :products, :rzadkie,        :boolean
    add_column :products, :geste,          :boolean
    add_column :products, :ekstra_geste,   :boolean
    add_column :products, :uniwersalne,    :boolean
    add_column :products, :z_ptfe,         :boolean
    add_column :products, :z_mos2,         :boolean
    add_column :products, :z_grafitem,     :boolean
    add_column :products, :biale,          :boolean
    add_column :products, :do_lozysk,      :boolean
    add_column :products, :do_bram,        :boolean
    add_column :products, :do_dzwigow,     :boolean
    add_column :products, :do_lancuchow,   :boolean
    add_column :products, :do_rowerow,     :boolean
    add_column :products, :do_zamkow,      :boolean
    # 
    # trzecia kolumna
    add_column :products, :litowe,                      :boolean
    add_column :products, :wysiegniki_alu,              :boolean
    add_column :products, :polsuche_srodki_smarne,      :boolean
    add_column :products, :oleje_wysokoczepne,          :boolean
    add_column :products, :smary_pelzajace,             :boolean
    add_column :products, :mtb,                         :boolean
    add_column :products, :szosa_i_trekking,            :boolean
    add_column :products, :zmywacze_rowerowe,           :boolean
    add_column :products, :spray_ochronny_do_zamkow,    :boolean
    add_column :products, :spray_do_zamkow,             :boolean
    add_column :products, :olejek_do_zamkow_z_teflonem, :boolean
  end
end
