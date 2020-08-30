class AddNoweFlagiToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :kategoria,                     :integer
    #
    add_column :products, :ekstra_geste,                  :boolean
    add_column :products, :geste,                         :boolean
    add_column :products, :rzadkie,                       :boolean
    add_column :products, :uniwersalne,                   :boolean
    add_column :products, :z_ptfe,                        :boolean
    add_column :products, :z_mos2,                        :boolean
    add_column :products, :z_grafitem,                    :boolean
    add_column :products, :biale,                         :boolean
    # 
    add_column :products, :do_lozysk,                     :boolean
    add_column :products, :do_bram,                       :boolean
    add_column :products, :do_dzwigow,                    :boolean
    add_column :products, :do_lancuchow,                  :boolean
    add_column :products, :do_gumy,                       :boolean
    add_column :products, :do_rowerow,                    :boolean
    add_column :products, :do_zamkow,                     :boolean
    # 
    add_column :products, :grafitowo_molibdenowe,         :boolean
    add_column :products, :oleje_precyzyjne_lekkie,       :boolean
    add_column :products, :dla_rolnictwa_i_lesnictwa,     :boolean
    add_column :products, :ochrona_przylaczy,             :boolean
    add_column :products, :kontakt_spray,                 :boolean
    add_column :products, :super_izolator,                :boolean
    add_column :products, :zmywacz,                       :boolean
    add_column :products, :olej_elektroserwisowy,         :boolean
    add_column :products, :pasty_miedziane,               :boolean
    add_column :products, :ekstra_geste_miedziane,        :boolean
    add_column :products, :pasty_ceramiczne,              :boolean
    add_column :products, :ekstra_geste_ceramiczne,       :boolean
    add_column :products, :pasty_aluminiowe,              :boolean
    add_column :products, :plyny_do_ciecia,               :boolean
    add_column :products, :oleje_do_gwintowania,          :boolean
    add_column :products, :pasty_do_gwintowania,          :boolean
    add_column :products, :odtluszczacz_maszynowy,        :boolean
    add_column :products, :zmywacz_serwisowy,             :boolean
    add_column :products, :zmywacz_smarujacy,             :boolean
    add_column :products, :zmywacz_konserwujacy,          :boolean
    add_column :products, :olej_ochronny,                 :boolean
    add_column :products, :wosk_ochronny,                 :boolean
    add_column :products, :pasta_ochronna,                :boolean
    add_column :products, :pasta_do_baterii,              :boolean
    add_column :products, :ekstra_gesta_pasta_do_baterii, :boolean
    # 
    add_column :products, :wapniowe,                      :boolean
    add_column :products, :smar_plynny,                   :boolean
    add_column :products, :smar_polsuchy,                 :boolean
    add_column :products, :polsuche_srodki_smarne,        :boolean
    add_column :products, :oleje_wysokoczepne,            :boolean
    add_column :products, :smary_pelzajace,               :boolean
    add_column :products, :plyn_do_oringu,                :boolean
    add_column :products, :pasta_do_oringu,               :boolean
    add_column :products, :ekstra_gesta_pasta_do_oringu,  :boolean
    add_column :products, :spraye_rowerowe,               :boolean
    add_column :products, :zmywacze_rowerowe,             :boolean
    # 
    add_column :products, :litowe,                        :boolean
    add_column :products, :do_wysiegnikow_alu,            :boolean
  end
end
