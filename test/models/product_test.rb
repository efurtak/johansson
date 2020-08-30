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
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
