# == Schema Information
#
# Table name: products
#
#  id                            :integer          not null, primary key
#  kod                           :string
#  tytul                         :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  poziom                        :integer
#  kategoria                     :integer
#  ekstra_geste                  :boolean
#  geste                         :boolean
#  rzadkie                       :boolean
#  uniwersalne                   :boolean
#  z_ptfe                        :boolean
#  z_mos2                        :boolean
#  z_grafitem                    :boolean
#  biale                         :boolean
#  do_lozysk                     :boolean
#  do_bram                       :boolean
#  do_dzwigow                    :boolean
#  do_lancuchow                  :boolean
#  do_gumy                       :boolean
#  do_rowerow                    :boolean
#  do_zamkow                     :boolean
#  grafitowo_molibdenowe         :boolean
#  oleje_precyzyjne_lekkie       :boolean
#  dla_rolnictwa_i_lesnictwa     :boolean
#  ochrona_przylaczy             :boolean
#  kontakt_spray                 :boolean
#  super_izolator                :boolean
#  zmywacz                       :boolean
#  olej_elektroserwisowy         :boolean
#  pasty_miedziane               :boolean
#  ekstra_geste_miedziane        :boolean
#  pasty_ceramiczne              :boolean
#  ekstra_geste_ceramiczne       :boolean
#  pasty_aluminiowe              :boolean
#  plyny_do_ciecia               :boolean
#  oleje_do_gwintowania          :boolean
#  pasty_do_gwintowania          :boolean
#  odtluszczacz_maszynowy        :boolean
#  zmywacz_serwisowy             :boolean
#  zmywacz_smarujacy             :boolean
#  zmywacz_konserwujacy          :boolean
#  olej_ochronny                 :boolean
#  wosk_ochronny                 :boolean
#  pasta_ochronna                :boolean
#  pasta_do_baterii              :boolean
#  ekstra_gesta_pasta_do_baterii :boolean
#  wapniowe                      :boolean
#  smar_plynny                   :boolean
#  smar_polsuchy                 :boolean
#  polsuche_srodki_smarne        :boolean
#  oleje_wysokoczepne            :boolean
#  smary_pelzajace               :boolean
#  plyn_do_oringu                :boolean
#  pasta_do_oringu               :boolean
#  ekstra_gesta_pasta_do_oringu  :boolean
#  spraye_rowerowe               :boolean
#  zmywacze_rowerowe             :boolean
#  litowe                        :boolean
#  do_wysiegnikow_alu            :boolean
#  tytul_en                      :text
#  tytul_de                      :text
#  tytul_se                      :text
#  tytul_ru                      :text
#



class Product < ApplicationRecord

  has_one_attached :miniatura, dependent: :destroy

  has_rich_text :opis_krotki
  has_rich_text :opis_dlugi

  has_rich_text :opis_krotki_en
  has_rich_text :opis_dlugi_en

  has_rich_text :opis_krotki_de
  has_rich_text :opis_dlugi_de

  has_rich_text :opis_krotki_se
  has_rich_text :opis_dlugi_se

  has_rich_text :opis_krotki_ru
  has_rich_text :opis_dlugi_ru



  validates :kod, presence: true
  
  # validates :tytul, presence: true
  # validates :tytul_en, presence: true
  # validates :tytul_de, presence: true
  # validates :tytul_se, presence: true
  # validates :tytul_ru, presence: true

  validates :poziom, presence: true
  validates :kategoria, presence: true

  validates :kod, uniqueness: true

  validates :miniatura, presence: true



  has_many :volumes, dependent: :destroy


  # all
  scope :wszystkie,                               -> { all.order(kod: :desc) }

  # smary
  scope :smary,                                   -> { where(kategoria: 1).order(kod: :desc) }

  scope :smary_ekstra_geste,                      -> { smary.where(ekstra_geste: true) }
  scope :smary_ekstra_geste_uniwersalne,          -> { smary_ekstra_geste.where(uniwersalne: true) }
  scope :smary_ekstra_geste_z_ptfe,               -> { smary_ekstra_geste.where(z_ptfe: true) }
  scope :smary_ekstra_geste_z_ptfe_litowe,        -> { smary_ekstra_geste_z_ptfe.where(litowe: true) }
  scope :smary_ekstra_geste_z_mos2,               -> { smary_ekstra_geste.where(z_mos2: true) }
  scope :smary_ekstra_geste_z_grafitem,           -> { smary_ekstra_geste.where(z_grafitem: true) }
  scope :smary_ekstra_geste_biale,                -> { smary_ekstra_geste.where(biale: true) }
  scope :smary_ekstra_geste_biale_wapniowe,       -> { smary_ekstra_geste_biale.where(wapniowe: true) }
  scope :smary_ekstra_geste_biale_z_ptfe,         -> { smary_ekstra_geste_biale.where(z_ptfe: true) }

  scope :smary_geste,                             -> { smary.where(geste: true) }
  scope :smary_geste_uniwersalne,                 -> { smary_geste.where(uniwersalne: true) }
  scope :smary_geste_z_ptfe,                      -> { smary_geste.where(z_ptfe: true) }
  scope :smary_geste_z_ptfe_litowe,               -> { smary_geste_z_ptfe.where(litowe: true) }
  scope :smary_geste_z_mos2,                      -> { smary_geste.where(z_mos2: true) }
  scope :smary_geste_z_grafitem,                  -> { smary_geste.where(z_grafitem: true) }
  scope :smary_geste_biale,                       -> { smary_geste.where(biale: true) }
  scope :smary_geste_biale_wapniowe,              -> { smary_geste_biale.where(wapniowe: true) }
  scope :smary_geste_biale_z_ptfe,                -> { smary_geste_biale.where(z_ptfe: true) }

  scope :smary_rzadkie,                           -> { smary.where(rzadkie: true) }
  scope :smary_rzadkie_uniwersalne,               -> { smary_rzadkie.where(uniwersalne: true) }
  scope :smary_rzadkie_z_ptfe,                    -> { smary_rzadkie.where(z_ptfe: true) }
  scope :smary_rzadkie_z_ptfe_litowe,             -> { smary_rzadkie_z_ptfe.where(litowe: true) }
  scope :smary_rzadkie_z_mos2,                    -> { smary_rzadkie.where(z_mos2: true) }
  scope :smary_rzadkie_z_grafitem,                -> { smary_rzadkie.where(z_grafitem: true) }
  scope :smary_rzadkie_biale,                     -> { smary_rzadkie.where(biale: true) }
  scope :smary_rzadkie_biale_wapniowe,            -> { smary_rzadkie_biale.where(wapniowe: true) }
  scope :smary_rzadkie_biale_z_ptfe,              -> { smary_rzadkie_biale.where(z_ptfe: true) }

  scope :smary_uniwersalne,                       -> { smary.where(uniwersalne: true) }
  scope :smary_uniwersalne_ekstra_geste,          -> { smary_uniwersalne.where(ekstra_geste: true) }
  scope :smary_uniwersalne_geste,                 -> { smary_uniwersalne.where(geste: true) }
  scope :smary_uniwersalne_rzadkie,               -> { smary_uniwersalne.where(rzadkie: true) }

  scope :smary_z_ptfe,                            -> { smary.where(z_ptfe: true) }
  scope :smary_z_ptfe_ekstra_geste,               -> { smary_z_ptfe.where(ekstra_geste: true) }
  scope :smary_z_ptfe_geste,                      -> { smary_z_ptfe.where(geste: true) }
  scope :smary_z_ptfe_rzadkie,                    -> { smary_z_ptfe.where(rzadkie: true) }

  scope :smary_z_mos2,                            -> { smary.where(z_mos2: true) }
  scope :smary_z_mos2_ekstra_geste,               -> { smary_z_mos2.where(ekstra_geste: true) }
  scope :smary_z_mos2_geste,                      -> { smary_z_mos2.where(geste: true) }
  scope :smary_z_mos2_rzadkie,                    -> { smary_z_mos2.where(rzadkie: true) }

  scope :smary_z_grafitem,                        -> { smary.where(z_grafitem: true) }
  scope :smary_z_grafitem_ekstra_geste,           -> { smary_z_grafitem.where(ekstra_geste: true) }
  scope :smary_z_grafitem_geste,                  -> { smary_z_grafitem.where(geste: true) }
  scope :smary_z_grafitem_rzadkie,                -> { smary_z_grafitem.where(rzadkie: true) }

  scope :smary_biale,                             -> { smary.where(biale: true) }
  scope :smary_biale_wapniowe,                    -> { smary_biale.where(wapniowe: true) }
  scope :smary_biale_wapniowe_ekstra_geste,       -> { smary_biale_wapniowe.where(ekstra_geste: true) }
  scope :smary_biale_wapniowe_geste,              -> { smary_biale_wapniowe.where(geste: true) }
  scope :smary_biale_wapniowe_rzadkie,            -> { smary_biale_wapniowe.where(rzadkie: true) }
  scope :smary_biale_z_ptfe,                      -> { smary_biale.where(z_ptfe: true) }
  scope :smary_biale_z_ptfe_ekstra_geste,         -> { smary_biale_z_ptfe.where(ekstra_geste: true) }
  scope :smary_biale_z_ptfe_geste,                -> { smary_biale_z_ptfe.where(geste: true) }
  scope :smary_biale_z_ptfe_rzadkie,              -> { smary_biale_z_ptfe.where(rzadkie: true) }



  # dedykowane
  scope :dedykowane,                              -> { where(kategoria: 2).order(kod: :desc) }

  scope :dedykowane_do_lozysk,                    -> { dedykowane.where(do_lozysk: true) }
  scope :dedykowane_do_lozysk_uniwersalne,        -> { dedykowane_do_lozysk.where(uniwersalne: true) }
  scope :dedykowane_do_lozysk_z_ptfe,             -> { dedykowane_do_lozysk.where(z_ptfe: true) }
  scope :dedykowane_do_lozysk_z_mos2,             -> { dedykowane_do_lozysk.where(z_mos2: true) }

  scope :dedykowane_do_bram,                      -> { dedykowane.where(do_bram: true) }
  scope :dedykowane_do_bram_uniwersalne,          -> { dedykowane_do_bram.where(uniwersalne: true) }
  scope :dedykowane_do_bram_z_ptfe,               -> { dedykowane_do_bram.where(z_ptfe: true) }
  scope :dedykowane_do_bram_z_mos2,               -> { dedykowane_do_bram.where(z_mos2: true) }

  scope :dedykowane_do_dzwigow,                                   -> { dedykowane.where(do_dzwigow: true) }
  scope :dedykowane_do_dzwigow_smar_plynny,                       -> { dedykowane_do_dzwigow.where(smar_plynny: true) }
  scope :dedykowane_do_dzwigow_smar_plynny_uniwersalne,           -> { dedykowane_do_dzwigow_smar_plynny.where(uniwersalne: true) }
  scope :dedykowane_do_dzwigow_smar_polsuchy,                     -> { dedykowane_do_dzwigow.where(smar_polsuchy: true) }
  scope :dedykowane_do_dzwigow_smar_polsuchy_z_ptfe,              -> { dedykowane_do_dzwigow_smar_polsuchy.where(z_ptfe: true) }
  scope :dedykowane_do_dzwigow_smar_polsuchy_z_mos2,              -> { dedykowane_do_dzwigow_smar_polsuchy.where(z_mos2: true) }
  scope :dedykowane_do_dzwigow_smar_polsuchy_z_grafitem,          -> { dedykowane_do_dzwigow_smar_polsuchy.where(z_grafitem: true) }
  scope :dedykowane_do_dzwigow_smar_polsuchy_do_wysiegnikow_alu,  -> { dedykowane_do_dzwigow_smar_polsuchy.where(do_wysiegnikow_alu: true) }

  scope :dedykowane_do_lancuchow,                                     -> { dedykowane.where(do_lancuchow: true) }
  scope :dedykowane_do_lancuchow_polsuche_srodki_smarne,              -> { dedykowane_do_lancuchow.where(polsuche_srodki_smarne: true) }
  scope :dedykowane_do_lancuchow_polsuche_srodki_smarne_uniwersalne,  -> { dedykowane_do_lancuchow_polsuche_srodki_smarne.where(uniwersalne: true) }
  scope :dedykowane_do_lancuchow_polsuche_srodki_smarne_z_ptfe,       -> { dedykowane_do_lancuchow_polsuche_srodki_smarne.where(z_ptfe: true) }
  scope :dedykowane_do_lancuchow_polsuche_srodki_smarne_z_mos2,       -> { dedykowane_do_lancuchow_polsuche_srodki_smarne.where(z_mos2: true) }
  scope :dedykowane_do_lancuchow_polsuche_srodki_smarne_z_grafitem,   -> { dedykowane_do_lancuchow_polsuche_srodki_smarne.where(z_grafitem: true) }
  scope :dedykowane_do_lancuchow_oleje_wysokoczepne,                  -> { dedykowane_do_lancuchow.where(oleje_wysokoczepne: true) }
  scope :dedykowane_do_lancuchow_oleje_wysokoczepne_uniwersalne,      -> { dedykowane_do_lancuchow_oleje_wysokoczepne.where(uniwersalne: true) }
  scope :dedykowane_do_lancuchow_oleje_wysokoczepne_z_ptfe,           -> { dedykowane_do_lancuchow_oleje_wysokoczepne.where(z_ptfe: true) }
  scope :dedykowane_do_lancuchow_oleje_wysokoczepne_z_mos2,           -> { dedykowane_do_lancuchow_oleje_wysokoczepne.where(z_mos2: true) }
  scope :dedykowane_do_lancuchow_oleje_wysokoczepne_z_grafitem,       -> { dedykowane_do_lancuchow_oleje_wysokoczepne.where(z_grafitem: true) }
  scope :dedykowane_do_lancuchow_smary_pelzajace,                     -> { dedykowane_do_lancuchow.where(smary_pelzajace: true) }
  scope :dedykowane_do_lancuchow_smary_pelzajace_uniwersalne,         -> { dedykowane_do_lancuchow_smary_pelzajace.where(uniwersalne: true) }
  scope :dedykowane_do_lancuchow_smary_pelzajace_z_ptfe,              -> { dedykowane_do_lancuchow_smary_pelzajace.where(z_ptfe: true) }
  scope :dedykowane_do_lancuchow_smary_pelzajace_z_mos2,              -> { dedykowane_do_lancuchow_smary_pelzajace.where(z_mos2: true) }
  scope :dedykowane_do_lancuchow_smary_pelzajace_z_grafitem,          -> { dedykowane_do_lancuchow_smary_pelzajace.where(z_grafitem: true) }

  scope :dedykowane_do_gumy,                                          -> { dedykowane.where(do_gumy: true) }
  scope :dedykowane_do_gumy_plyn_do_oringu,                           -> { dedykowane_do_gumy.where(plyn_do_oringu: true) }
  scope :dedykowane_do_gumy_pasta_do_oringu,                          -> { dedykowane_do_gumy.where(pasta_do_oringu: true) }
  scope :dedykowane_do_gumy_ekstra_gesta_pasta_do_oringu,             -> { dedykowane_do_gumy.where(ekstra_gesta_pasta_do_oringu: true) }

  scope :dedykowane_do_rowerow,                      -> { dedykowane.where(do_rowerow: true) }
  scope :dedykowane_do_rowerow_spraye_rowerowe,      -> { dedykowane_do_rowerow.where(spraye_rowerowe: true) }
  scope :dedykowane_do_rowerow_zmywacze_rowerowe,    -> { dedykowane_do_rowerow.where(zmywacze_rowerowe: true) }

  scope :dedykowane_do_zamkow,                       -> { dedykowane.where(do_zamkow: true) }
  scope :dedykowane_do_zamkow_uniwersalne,           -> { dedykowane_do_zamkow.where(uniwersalne: true) }
  scope :dedykowane_do_zamkow_z_ptfe,                -> { dedykowane_do_zamkow.where(z_ptfe: true) }



  # odrdzewiacze
  scope :odrdzewiacze,                               -> { where(kategoria: 3).order(kod: :desc) }

  scope :odrdzewiacze_uniwersalne,                   -> { odrdzewiacze.where(uniwersalne: true) }
  scope :odrdzewiacze_z_ptfe,                        -> { odrdzewiacze.where(z_ptfe: true) }
  scope :odrdzewiacze_z_mos2,                        -> { odrdzewiacze.where(z_mos2: true) }
  scope :odrdzewiacze_z_grafitem,                    -> { odrdzewiacze.where(z_grafitem: true) }
  scope :odrdzewiacze_grafitowo_molibdenowe,         -> { odrdzewiacze.where(grafitowo_molibdenowe: true) }



  # multispraye
  scope :multispraye,                                -> { where(kategoria: 4).order(kod: :desc) }

  scope :multispraye_uniwersalne,                    -> { multispraye.where(uniwersalne: true) }
  scope :multispraye_z_ptfe,                         -> { multispraye.where(z_ptfe: true) }
  scope :multispraye_z_mos2,                         -> { multispraye.where(z_mos2: true) }
  scope :multispraye_z_grafitem,                     -> { multispraye.where(z_grafitem: true) }



  # oleje
  scope :oleje,                                      -> { where(kategoria: 5).order(kod: :desc) }

  scope :oleje_oleje_precyzyjne_lekkie,              -> { oleje.where(oleje_precyzyjne_lekkie: true) }
  scope :oleje_uniwersalne,                          -> { oleje.where(uniwersalne: true) }
  scope :oleje_z_ptfe,                               -> { oleje.where(z_ptfe: true) }
  scope :oleje_z_mos2,                               -> { oleje.where(z_mos2: true) }
  scope :oleje_z_grafitem,                           -> { oleje.where(z_grafitem: true) }
  scope :oleje_dla_rolnictwa_i_lesnictwa,            -> { oleje.where(dla_rolnictwa_i_lesnictwa: true) }



  # elektryka i mechanika
  scope :elektryka_i_mechanika,                         -> { where(kategoria: 6).order(kod: :desc) }

  scope :elektryka_i_mechanika_ochrona_przylaczy,       -> { elektryka_i_mechanika.where(ochrona_przylaczy: true) }
  scope :elektryka_i_mechanika_kontakt_spray,           -> { elektryka_i_mechanika.where(kontakt_spray: true) }
  scope :elektryka_i_mechanika_super_izolator,          -> { elektryka_i_mechanika.where(super_izolator: true) }
  scope :elektryka_i_mechanika_zmywacz,                 -> { elektryka_i_mechanika.where(zmywacz: true) }
  scope :elektryka_i_mechanika_olej_elektroserwisowy,   -> { elektryka_i_mechanika.where(olej_elektroserwisowy: true) }



  # pasty montazowe ochronne
  scope :pasty_montazowe_ochronne,                            -> { where(kategoria: 7).order(kod: :desc) }

  scope :pasty_montazowe_ochronne_pasty_miedziane,            -> { pasty_montazowe_ochronne.where(pasty_miedziane: true) }
  scope :pasty_montazowe_ochronne_ekstra_geste_miedziane,     -> { pasty_montazowe_ochronne.where(ekstra_geste_miedziane: true) }
  scope :pasty_montazowe_ochronne_pasty_ceramiczne,           -> { pasty_montazowe_ochronne.where(pasty_ceramiczne: true) }
  scope :pasty_montazowe_ochronne_ekstra_geste_ceramiczne,    -> { pasty_montazowe_ochronne.where(ekstra_geste_ceramiczne: true) }
  scope :pasty_montazowe_ochronne_pasty_aluminiowe,           -> { pasty_montazowe_ochronne.where(pasty_aluminiowe: true) }



  # obrobka metali
  scope :obrobka_metali,                                -> { where(kategoria: 8).order(kod: :desc) }

  scope :obrobka_metali_plyny_do_ciecia,                -> { obrobka_metali.where(plyny_do_ciecia: true) }
  scope :obrobka_metali_oleje_do_gwintowania,           -> { obrobka_metali.where(oleje_do_gwintowania: true) }
  scope :obrobka_metali_pasty_do_gwintowania,           -> { obrobka_metali.where(pasty_do_gwintowania: true) }



  # pasy klinowe
  scope :pasy_klinowe,                                  -> { where(kategoria: 9).order(kod: :desc) }



  # wazeliny
  scope :wazeliny,                                      -> { where(kategoria: 10).order(kod: :desc) }

  scope :wazeliny_ekstra_geste,                         -> { wazeliny.where(ekstra_geste: true) }
  scope :wazeliny_geste,                                -> { wazeliny.where(geste: true) }
  scope :wazeliny_rzadkie,                              -> { wazeliny.where(rzadkie: true) }



  # zmywacze
  scope :zmywacze,                                      -> { where(kategoria: 11).order(kod: :desc) }

  scope :zmywacze_odtluszczacz_maszynowy,               -> { zmywacze.where(odtluszczacz_maszynowy: true) }
  scope :zmywacze_zmywacz_serwisowy,                    -> { zmywacze.where(zmywacz_serwisowy: true) }
  scope :zmywacze_zmywacz_smarujacy,                    -> { zmywacze.where(zmywacz_smarujacy: true) }
  scope :zmywacze_zmywacz_konserwujacy,                 -> { zmywacze.where(zmywacz_konserwujacy: true) }



  # antykorozyjne
  scope :antykorozyjne,                                 -> { where(kategoria: 12).order(kod: :desc) }

  scope :antykorozyjne_olej_ochronny,                   -> { antykorozyjne.where(olej_ochronny: true) }
  scope :antykorozyjne_wosk_ochronny,                   -> { antykorozyjne.where(wosk_ochronny: true) }
  scope :antykorozyjne_pasta_ochronna,                  -> { antykorozyjne.where(pasta_ochronna: true) }



  # AKU pasta
  scope :aku_pasta,                                     -> { where(kategoria: 13).order(kod: :desc) }

  scope :aku_pasta_pasta_do_baterii,                    -> { aku_pasta.where(pasta_do_baterii: true) }
  scope :aku_pasta_ekstra_gesta_pasta_do_baterii,       -> { aku_pasta.where(ekstra_gesta_pasta_do_baterii: true) }

end
