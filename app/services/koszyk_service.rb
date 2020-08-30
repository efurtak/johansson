class KoszykService
  def initialize(koszyk_hash:)
    @koszyk = koszyk_hash
  end

  def dodaj_do_koszyka(merge_hash:)
    @koszyk.merge!(merge_hash)
  end
  
  def ile_sztuk(wariant:)
    @koszyk.fetch(wariant)
  end

  def ile_w_koszyku
    @koszyk.keys.size
  end

  def klucze
    @koszyk.keys
  end

  def oproznij_koszyk
    @koszyk = {}
  end

  def usun_z_koszyka(wariant:)
    @koszyk.delete_if { |key, value| key.to_s == wariant.to_s }
  end

  def zawartosc_koszyka
    @koszyk
  end
end