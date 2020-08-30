module ProductsHelper
  
  def volumes_only(product:)
    Volume.where(product_id: product.id).map { |volume| volume.pojemnosc }.uniq.sort.reverse.join(', ')
  end

  def nazwa_kategorii(filter:, locale:)
    nazwy = {
      'pl' => {
        'wszystkie' => 'Wszystkie produkty',

        'smary' => 'Smary',

        'smary_ekstra_geste' => 'Smary ekstra gęste',
        'smary_ekstra_geste_uniwersalne' => 'Smary ekstra gęste uniwersalne',
        'smary_ekstra_geste_z_ptfe' => 'Smary ekstra gęste z ptfe',
        'smary_ekstra_geste_z_ptfe_litowe' => 'Smary ekstra gęste z ptfe litowe',
        'smary_ekstra_geste_z_mos2' => 'Smary ekstra gęste z mos2',
        'smary_ekstra_geste_z_grafitem' => 'Smary ekstra gęste z grafitem',
        'smary_ekstra_geste_biale' => 'Smary ekstra gęste białe',
        'smary_ekstra_geste_biale_wapniowe' => 'Smary ekstra gęste białe wapniowe',
        'smary_ekstra_geste_biale_z_ptfe' => 'Smary ekstra gęste białe z ptfe',

        'smary_geste' => 'Smary gęste',
        'smary_geste_uniwersalne' => 'Smary gęste uniwersalne',
        'smary_geste_z_ptfe' => 'Smary gęste z ptfe',
        'smary_geste_z_ptfe_litowe' => 'Smary gęste z ptfe litowe',
        'smary_geste_z_mos2' => 'Smary gęste z mos2',
        'smary_geste_z_grafitem' => 'Smary gęste z grafitem',
        'smary_geste_biale' => 'Smary gęste białe',
        'smary_geste_biale_wapniowe' => 'Smary gęste białe wapniowe',
        'smary_geste_biale_z_ptfe' => 'Smary gęste białe z ptfe',

        'smary_rzadkie' => 'Smary rzadkie',
        'smary_rzadkie_uniwersalne' => 'Smary rzadkie uniwersalne',
        'smary_rzadkie_z_ptfe' => 'Smary rzadkie z ptfe',
        'smary_rzadkie_z_ptfe_litowe' => 'Smary rzadkie z ptfe litowe',
        'smary_rzadkie_z_mos2' => 'Smary rzadkie z mos2',
        'smary_rzadkie_z_grafitem' => 'Smary rzadkie z grafitem',
        'smary_rzadkie_biale' => 'Smary rzadkie białe',
        'smary_rzadkie_biale_wapniowe' => 'Smary rzadkie białe wapniowe',
        'smary_rzadkie_biale_z_ptfe' => 'Smary rzadkie białe z ptfe',

        'smary_uniwersalne' => 'Smary uniwersalne',
        'smary_uniwersalne_ekstra_geste' => 'Smary uniwersalne ekstra gęste',
        'smary_uniwersalne_geste' => 'Smary uniwersalne gęste',
        'smary_uniwersalne_rzadkie' => 'Smary uniwersalne rzadkie',

        'smary_z_ptfe' => 'Smary z ptfe',
        'smary_z_ptfe_ekstra_geste' => 'Smary z ptfe ekstra gęste',
        'smary_z_ptfe_geste' => 'Smary z ptfe gęste',
        'smary_z_ptfe_rzadkie' => 'Smary z ptfe rzadkie',

        'smary_z_mos2' => 'Smary z mos2',
        'smary_z_mos2_ekstra_geste' => 'Smary z mos2 ekstra gęste',
        'smary_z_mos2_geste' => 'Smary z mos2 gęste',
        'smary_z_mos2_rzadkie' => 'Smary z mos2 rzadkie',

        'smary_z_grafitem' => 'Smary z grafitem',
        'smary_z_grafitem_ekstra_geste' => 'Smary z grafitem ekstra gęste',
        'smary_z_grafitem_geste' => 'Smary z grafitem gęste',
        'smary_z_grafitem_rzadkie' => 'Smary z grafitem rzadkie',

        'smary_biale' => 'Smary białe',
        'smary_biale_wapniowe' => 'Smary białe wapniowe',
        'smary_biale_wapniowe_ekstra_geste' => 'Smary białe wapniowe ekstra gęste',
        'smary_biale_wapniowe_geste' => 'Smary białe wapniowe gęste',
        'smary_biale_wapniowe_rzadkie' => 'Smary białe wapniowe rzadkie',
        'smary_biale_z_ptfe' => 'Smary białe z ptfe',
        'smary_biale_z_ptfe_ekstra_geste' => 'Smary białe z ptfe ekstra gęste',
        'smary_biale_z_ptfe_geste' => 'Smary białe z ptfe gęste',
        'smary_biale_z_ptfe_rzadkie' => 'Smary białe z ptfe rzadkie',

        'dedykowane' => 'Dedykowane',

        'dedykowane_do_lozysk' => 'Dedykowane do łożysk',
        'dedykowane_do_lozysk_uniwersalne' => 'Dedykowane do łożysk uniwersalne',
        'dedykowane_do_lozysk_z_ptfe' => 'Dedykowane do łożysk z ptfe',
        'dedykowane_do_lozysk_z_mos2' => 'Dedykowane_do_łożysk z mos2',

        'dedykowane_do_bram' => 'Dedykowane do bram',
        'dedykowane_do_bram_uniwersalne' => 'Dedykowane do bram uniwersalne',
        'dedykowane_do_bram_z_ptfe' => 'Dedykowane do bram z ptfe',
        'dedykowane_do_bram_z_mos2' => 'Dedykowane do bram z mos2',
        
        'dedykowane_do_dzwigow' => 'Dedykowane do dźwigów',
        'dedykowane_do_dzwigow_smar_plynny' => 'Dedykowane do dźwigów smar płynny',
        'dedykowane_do_dzwigow_smar_plynny_uniwersalne' => 'Dedykowane do dźwigów smar płynny uniwersalne',
        'dedykowane_do_dzwigow_smar_polsuchy' => 'Dedykowane do dźwigów smar półsuchy',
        'dedykowane_do_dzwigow_smar_polsuchy_z_ptfe' => 'Dedykowane do dźwigów smar półsuchy z ptfe',
        'dedykowane_do_dzwigow_smar_polsuchy_z_mos2' => 'Dedykowane do dźwigów smar półsuchy z mos2',
        'dedykowane_do_dzwigow_smar_polsuchy_z_grafitem' => 'Dedykowane do dźwigów smar półsuchy z grafitem',
        'dedykowane_do_dzwigow_smar_polsuchy_do_wysiegnikow_alu' => 'Dedykowane do dźwigów smar półsuchy do wysięgników alu',

        'dedykowane_do_lancuchow' => 'Dedykowane do łancuchów',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne' => 'Dedykowane do łańcuchów półsuche środki smarne',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_uniwersalne' => 'Dedykowane do łańcuchów półsuche środki smarne uniwersalne',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_ptfe' => 'Dedykowane do łańcuchów półsuche środki smarne z ptfe',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_mos2' => 'Dedykowane do łańcuchów półsuche środki smarne z mos2',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_grafitem' => 'Dedykowane do łańcuchów półsuche środki smarne z grafitem',
        'dedykowane_do_lancuchow_oleje_wysokoczepne' => 'Dedykowane do łańcuchów oleje wysokoczepne',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_uniwersalne' => 'Dedykowane do łańcuchów oleje wysokoczepne uniwersalne',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_ptfe' => 'Dedykowane do łańcuchów oleje wysokoczepne z ptfe',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_mos2' => 'Dedykowane do łańcuchów oleje wysokoczepne z mos2',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_grafitem' => 'Dedykowane do łańcuchów oleje wysokoczepne z grafitem',
        'dedykowane_do_lancuchow_smary_pelzajace' => 'Dedykowane do łańcuchów smary pełzające',
        'dedykowane_do_lancuchow_smary_pelzajace_uniwersalne' => 'Dedykowane do łańcuchów smary pełzające uniwersalne',
        'dedykowane_do_lancuchow_smary_pelzajace_z_ptfe' => 'Dedykowane do łańcuchów smary pełzające z ptfe',
        'dedykowane_do_lancuchow_smary_pelzajace_z_mos2' => 'Dedykowane do łańcuchów smary pełzające z mos2',
        'dedykowane_do_lancuchow_smary_pelzajace_z_grafitem' => 'Dedykowane do łańcuchów smary pełzające z grafitem',

        'dedykowane_do_gumy' => 'Dedykowane do gumy',
        'dedykowane_do_gumy_plyn_do_oringu' => 'Dedykowane do gumy płyn do oringu',
        'dedykowane_do_gumy_pasta_do_oringu' => 'Dedykowane do gumy pasta do oringu',
        'dedykowane_do_gumy_ekstra_gesta_pasta_do_oringu' => 'Dedykowane do gumy ekstra gęsta pasta do oringu',

        'dedykowane_do_rowerow' => 'Dedykowane do rowerów',
        'dedykowane_do_rowerow_spraye_rowerowe' => 'Dedykowane do rowerów spraye rowerowe',
        'dedykowane_do_rowerow_zmywacze_rowerowe' => 'Dedykowane do rowerów zmywacze rowerowe',

        'dedykowane_do_zamkow' => 'Dedykowane do zamków',
        'dedykowane_do_zamkow_uniwersalne' => 'Dedykowane do zamków uniwersalne',
        'dedykowane_do_zamkow_z_ptfe' => 'Dedykowane do zamków z ptfe',

        'odrdzewiacze' => 'Odrdzewiacze',

        'odrdzewiacze_uniwersalne' => 'Odrdzewiacze uniwersalne',
        'odrdzewiacze_z_ptfe' => 'Odrdzewiacze z ptfe',
        'odrdzewiacze_z_mos2' => 'Odrdzewiacze z mos2',
        'odrdzewiacze_z_grafitem' => 'Odrdzewiacze z grafitem',
        'odrdzewiacze_grafitowo_molibdenowe' => 'Odrdzewiacze grafitowo molibdenowe',

        'multispraye' => 'Multispraye',

        'multispraye_uniwersalne' => 'Multispraye uniwersalne',
        'multispraye_z_ptfe' => 'Multispraye z ptfe',
        'multispraye_z_mos2' => 'Multispraye z mos2',
        'multispraye_z_grafitem' => 'Multispraye z grafitem',

        'oleje' => 'Oleje',

        'oleje_oleje_precyzyjne_lekkie' => 'Oleje oleje precyzyjne lekkie',
        'oleje_uniwersalne' => 'Oleje uniwersalne',
        'oleje_z_ptfe' => 'Oleje z ptfe',
        'oleje_z_mos2' => 'Oleje z mos2',
        'oleje_z_grafitem' => 'Oleje z grafitem',
        'oleje_dla_rolnictwa_i_lesnictwa' => 'Oleje dla rolnictwa i leśnictwa',

        'elektryka_i_mechanika' => 'Elektryka i mechanika',

        'elektryka_i_mechanika_ochrona_przylaczy' => 'Elektryka i mechanika ochrona przyłączy',
        'elektryka_i_mechanika_kontakt_spray' => 'Elektryka i mechanika kontakt spray',
        'elektryka_i_mechanika_super_izolator' => 'Elektryka i mechanika super izolator',
        'elektryka_i_mechanika_zmywacz' => 'Elektryka i mechanika zmywacz',
        'elektryka_i_mechanika_olej_elektroserwisowy' => 'Elektryka i mechanika olej elektroserwisowy',

        'pasty_montazowe_ochronne' => 'Pasty montażowe ochronne',

        'pasty_montazowe_ochronne_pasty_miedziane' => 'Pasty montażowe ochronne pasty miedziane',
        'pasty_montazowe_ochronne_ekstra_geste_miedziane' => 'Pasty montażowe ochronne ekstra gęste miedziane',
        'pasty_montazowe_ochronne_pasty_ceramiczne' => 'Pasty montażowe ochronne pasty ceramiczne',
        'pasty_montazowe_ochronne_ekstra_geste_ceramiczne' => 'Pasty montażowe ochronne ekstra gęste ceramiczne',
        'pasty_montazowe_ochronne_pasty_aluminiowe' => 'Pasty montażowe ochronne pasty aluminiowe',

        'obrobka_metali' => 'Obróbka metali',

        'obrobka_metali_plyny_do_ciecia' => 'Obróbka metali płyny do cięcia',
        'obrobka_metali_oleje_do_gwintowania' => 'Obróbka metali oleje do gwintowania',
        'obrobka_metali_pasty_do_gwintowania' => 'Obróbka metali pasty do gwintowania',

        'pasy_klinowe' => 'Pasy klinowe',

        'wazeliny' => 'Wazeliny',

        'wazeliny_ekstra_geste' => 'Wazeliny ekstra gęste',
        'wazeliny_geste' => 'Wazeliny gęste',
        'wazeliny_rzadkie' => 'Wazeliny rzadkie',

        'zmywacze' => 'Zmywacze',

        'zmywacze_odtluszczacz_maszynowy' => 'Zmywacze odtłuszczacz maszynowy',
        'zmywacze_zmywacz_serwisowy' => 'Zmywacze zmywacz serwisowy',
        'zmywacze_zmywacz_smarujacy' => 'Zmywacze zmywacz smarujący',
        'zmywacze_zmywacz_konserwujacy' => 'Zmywacze zmywacz konserwujący',

        'antykorozyjne' => 'Antykorozyjne',

        'antykorozyjne_olej_ochronny' => 'Antykorozyjne olej ochronny',
        'antykorozyjne_wosk_ochronny' => 'Antykorozyjne wosk ochronny',
        'antykorozyjne_pasta_ochronna' => 'Antykorozyjne pasta ochronna',

        'aku_pasta' => 'Aku pasta',

        'aku_pasta_pasta_do_baterii' => 'Aku pasta pasta do baterii',
        'aku_pasta_ekstra_gesta_pasta_do_baterii' => 'Aku pasta ekstra gęsta pasta do baterii'
      },

      'en' => {
        'wszystkie' => 'All products',

        'smary' => 'Greases',

        'smary_ekstra_geste' => 'Extra thick greases',
        'smary_ekstra_geste_uniwersalne' => 'Extra thick greases - universal',
        'smary_ekstra_geste_z_ptfe' => 'Extra thick greases - with ptfe',
        'smary_ekstra_geste_z_ptfe_litowe' => 'Extra thick greases - ptfe lithium',
        'smary_ekstra_geste_z_mos2' => 'Extra thick greases - with mos2',
        'smary_ekstra_geste_z_grafitem' => 'Extra thick greases - with graphite',
        'smary_ekstra_geste_biale' => 'Extra thick greases - white',
        'smary_ekstra_geste_biale_wapniowe' => 'Extra thick greases - white calcium',
        'smary_ekstra_geste_biale_z_ptfe' => 'Extra thick greases - white ptfe',

        'smary_geste' => 'Thick greases',
        'smary_geste_uniwersalne' => 'Thick greases - universal',
        'smary_geste_z_ptfe' => 'Thick greases - with ptfe',
        'smary_geste_z_ptfe_litowe' => 'Thick greases - ptfe lithium',
        'smary_geste_z_mos2' => 'Thick greases - with mos2',
        'smary_geste_z_grafitem' => 'Thick greases - with graphite',
        'smary_geste_biale' => 'Thick greases - white',
        'smary_geste_biale_wapniowe' => 'Thick greases - white calcium',
        'smary_geste_biale_z_ptfe' => 'Thick greases - white with ptfe',

        'smary_rzadkie' => 'Thin greases',
        'smary_rzadkie_uniwersalne' => 'Thin greases - universal',
        'smary_rzadkie_z_ptfe' => 'Thin greases - ptfe',
        'smary_rzadkie_z_ptfe_litowe' => 'Thin greases - ptfe lithium',
        'smary_rzadkie_z_mos2' => 'Thin greases - with mos2',
        'smary_rzadkie_z_grafitem' => 'Thin greases - with graphite',
        'smary_rzadkie_biale' => 'Thin greases - white',
        'smary_rzadkie_biale_wapniowe' => 'Thin greases - white calcium',
        'smary_rzadkie_biale_z_ptfe' => 'Thin greases - white ptfe',

        'smary_uniwersalne' => 'Universal greases',
        'smary_uniwersalne_ekstra_geste' => 'Universal greases - extra thick',
        'smary_uniwersalne_geste' => 'Universal greases - thick',
        'smary_uniwersalne_rzadkie' => 'Universal greases - thin',

        'smary_z_ptfe' => 'PTFE greases',
        'smary_z_ptfe_ekstra_geste' => 'PTFE greases - extra thick',
        'smary_z_ptfe_geste' => 'PTFE greases - thick',
        'smary_z_ptfe_rzadkie' => 'PTFE greases - thin',

        'smary_z_mos2' => 'Mos2 greases',
        'smary_z_mos2_ekstra_geste' => 'Mos2 greases - extra thick',
        'smary_z_mos2_geste' => 'Mos2 greases - thick',
        'smary_z_mos2_rzadkie' => 'Mos2 greases - thin',

        'smary_z_grafitem' => 'Graphite greases',
        'smary_z_grafitem_ekstra_geste' => 'Graphite greases - extra thick',
        'smary_z_grafitem_geste' => 'Graphite greases - thick',
        'smary_z_grafitem_rzadkie' => 'Graphite greases - thin',

        'smary_biale' => 'White greases',
        'smary_biale_wapniowe' => 'White calcium greases',
        'smary_biale_wapniowe_ekstra_geste' => 'White calcium greases - extra thick',
        'smary_biale_wapniowe_geste' => 'White calcium greases - thick',
        'smary_biale_wapniowe_rzadkie' => 'White calcium greases - thin',
        'smary_biale_z_ptfe' => 'White ptfe greases',
        'smary_biale_z_ptfe_ekstra_geste' => 'White ptfe greases - extra thick',
        'smary_biale_z_ptfe_geste' => 'White ptfe greases - thick',
        'smary_biale_z_ptfe_rzadkie' => 'White ptfe greases - thin',

        'dedykowane' => 'Dedicated',

        'dedykowane_do_lozysk' => 'Dedicated to bearings',
        'dedykowane_do_lozysk_uniwersalne' => 'Dedicated to bearings - universal',
        'dedykowane_do_lozysk_z_ptfe' => 'Dedicated to bearings - with ptfe',
        'dedykowane_do_lozysk_z_mos2' => 'Dedicated to bearings - with mos2',

        'dedykowane_do_bram' => 'Dedicated to gates',
        'dedykowane_do_bram_uniwersalne' => 'Dedicated to gates - universal',
        'dedykowane_do_bram_z_ptfe' => 'Dedicated to gates - with ptfe',
        'dedykowane_do_bram_z_mos2' => 'Dedicated to gates - with mos2',
        
        'dedykowane_do_dzwigow' => 'Dedicated to cranes',
        'dedykowane_do_dzwigow_smar_plynny' => 'Dedicated to cranes - liquid grease',
        'dedykowane_do_dzwigow_smar_plynny_uniwersalne' => 'Dedicated to cranes - universal liquid grease',
        'dedykowane_do_dzwigow_smar_polsuchy' => 'Dedicated to cranes - semi-dry grease',
        'dedykowane_do_dzwigow_smar_polsuchy_z_ptfe' => 'Dedicated to cranes - semi-dry ptfe grease',
        'dedykowane_do_dzwigow_smar_polsuchy_z_mos2' => 'Dedicated to cranes - semi-dry grease with mos2',
        'dedykowane_do_dzwigow_smar_polsuchy_z_grafitem' => 'Dedicated to cranes - semi-dry grease with graphite',
        'dedykowane_do_dzwigow_smar_polsuchy_do_wysiegnikow_alu' => 'Dedicated to cranes - semi-dry grease for aluminum booms',

        'dedykowane_do_lancuchow' => 'Dedicated to chains',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne' => 'Dedicated to chains - semi-dry lubricants',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_uniwersalne' => 'Dedicated to chains - semi-dry universal lubricants',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_ptfe' => 'Dedicated to chains - semi-dry ptfe lubricants',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_mos2' => 'Dedicated to chains - semi-dry mos2 lubricants',
        'dedykowane_do_lancuchow_polsuche_srodki_smarne_z_grafitem' => 'Dedicated to chains - semi-dry graphite lubricants',
        'dedykowane_do_lancuchow_oleje_wysokoczepne' => 'Dedicated to chains - high-pressure oils',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_uniwersalne' => 'Dedicated to chains - universal high-pressure oils',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_ptfe' => 'Dedicated to chains - high-pressure ptfe oils',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_mos2' => 'Dedicated to chains - high-pressure oils with mos2',
        'dedykowane_do_lancuchow_oleje_wysokoczepne_z_grafitem' => 'Dedicated to chains - high-pressure oils with graphite',
        'dedykowane_do_lancuchow_smary_pelzajace' => 'Dedicated to chains - crawling greases',
        'dedykowane_do_lancuchow_smary_pelzajace_uniwersalne' => 'Dedicated to chains - universal crawling greases',
        'dedykowane_do_lancuchow_smary_pelzajace_z_ptfe' => 'Dedicated to chains - crawling greases with ptfe',
        'dedykowane_do_lancuchow_smary_pelzajace_z_mos2' => 'Dedicated to chains - crawling greases with mos2',
        'dedykowane_do_lancuchow_smary_pelzajace_z_grafitem' => 'Dedicated to chains - crawling graphite greases',

        'dedykowane_do_gumy' => 'Dedicated to rubber',
        'dedykowane_do_gumy_plyn_do_oringu' => 'Dedicated to rubber - o-ring fluid',
        'dedykowane_do_gumy_pasta_do_oringu' => 'Dedicated to rubber - o-ring paste',
        'dedykowane_do_gumy_ekstra_gesta_pasta_do_oringu' => 'Dedicated to rubber - extra thick o-ring paste',

        'dedykowane_do_rowerow' => 'Dedicated to bicycles',
        'dedykowane_do_rowerow_spraye_rowerowe' => 'Dedicated to bicycles - bicycle sprays',
        'dedykowane_do_rowerow_zmywacze_rowerowe' => 'Dedicated to bicycles - bicycle cleaners',

        'dedykowane_do_zamkow' => 'Dedicated to locks',
        'dedykowane_do_zamkow_uniwersalne' => 'Dedicated to locks - universal',
        'dedykowane_do_zamkow_z_ptfe' => 'Dedicated to locks - with ptfe',

        'odrdzewiacze' => 'Rust removers',

        'odrdzewiacze_uniwersalne' => 'Rust removers - universal',
        'odrdzewiacze_z_ptfe' => 'Rust removers - with ptfe',
        'odrdzewiacze_z_mos2' => 'Rust removers - with mos2',
        'odrdzewiacze_z_grafitem' => 'Rust removers - with graphite',
        'odrdzewiacze_grafitowo_molibdenowe' => 'Rust removers - graphite molybdenum',

        'multispraye' => 'Multisprays',

        'multispraye_uniwersalne' => 'Multisprays - universal',
        'multispraye_z_ptfe' => 'Multisprays - with ptfe',
        'multispraye_z_mos2' => 'Multisprays - with mos2',
        'multispraye_z_grafitem' => 'Multisprays - with graphite',

        'oleje' => 'Oils',

        'oleje_oleje_precyzyjne_lekkie' => 'Oils - light precision oils',
        'oleje_uniwersalne' => 'Oils - universal',
        'oleje_z_ptfe' => 'Oils - with ptfe',
        'oleje_z_mos2' => 'Oils - with mos2',
        'oleje_z_grafitem' => 'Oils - with graphite',
        'oleje_dla_rolnictwa_i_lesnictwa' => 'Oils - for agriculture and forestry',

        'elektryka_i_mechanika' => 'Electricity and mechanics',

        'elektryka_i_mechanika_ochrona_przylaczy' => 'Electricity and mechanics - connection protection',
        'elektryka_i_mechanika_kontakt_spray' => 'Electricity and mechanics - contact spray',
        'elektryka_i_mechanika_super_izolator' => 'Electricity and mechanics - super insulator',
        'elektryka_i_mechanika_zmywacz' => 'Electricity and mechanics - remover',
        'elektryka_i_mechanika_olej_elektroserwisowy' => 'Electricity and mechanics - electroservice oil',

        'pasty_montazowe_ochronne' => 'Protective assembly pastes',

        'pasty_montazowe_ochronne_pasty_miedziane' => 'Protective assembly pastes - copper pastes',
        'pasty_montazowe_ochronne_ekstra_geste_miedziane' => 'Protective assembly pastes - extra thick copper',
        'pasty_montazowe_ochronne_pasty_ceramiczne' => 'Protective assembly pastes - ceramic pastes',
        'pasty_montazowe_ochronne_ekstra_geste_ceramiczne' => 'Protective assembly pastes - extra thick ceramic',
        'pasty_montazowe_ochronne_pasty_aluminiowe' => 'Protective assembly pastes - aluminum pastes',

        'obrobka_metali' => 'Metalworking',

        'obrobka_metali_plyny_do_ciecia' => 'Metalworking - cutting fluids',
        'obrobka_metali_oleje_do_gwintowania' => 'Metalworking - threading oils',
        'obrobka_metali_pasty_do_gwintowania' => 'Metalworking - threading pastes',

        'pasy_klinowe' => 'V-belts',

        'wazeliny' => 'Vaseline',

        'wazeliny_ekstra_geste' => 'Vaseline - extra thick',
        'wazeliny_geste' => 'Vaseline - thick',
        'wazeliny_rzadkie' => 'Vaseline - thin',

        'zmywacze' => 'Removers',

        'zmywacze_odtluszczacz_maszynowy' => 'Removers - machine degreaser',
        'zmywacze_zmywacz_serwisowy' => 'Removers - service cleaner',
        'zmywacze_zmywacz_smarujacy' => 'Removers - lubricant cleaner',
        'zmywacze_zmywacz_konserwujacy' => 'Removers - preservative cleaner',

        'antykorozyjne' => 'Anticorrosive',

        'antykorozyjne_olej_ochronny' => 'Anticorrosive - protective oil',
        'antykorozyjne_wosk_ochronny' => 'Anticorrosive - protective wax',
        'antykorozyjne_pasta_ochronna' => 'Anticorrosive - protective paste',

        'aku_pasta' => 'Accumulator paste',

        'aku_pasta_pasta_do_baterii' => 'Accumulator paste - battery paste',
        'aku_pasta_ekstra_gesta_pasta_do_baterii' => 'Accumulator paste - extra thick battery paste'
      }
    }

    nazwy[locale.to_s][filter]
  end
end
