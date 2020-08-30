class CartController < ApplicationController
  layout 'application_cart'

  def index
    cookies[:koszyk] = JSON.generate({}) if cookies[:koszyk].nil?
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))

    @volumes = Volume.where(id: @koszyk.klucze)
  end



  def cart_add_to
    cookies[:koszyk] = JSON.generate({}) if cookies[:koszyk].nil?
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))

    ilosc = params[:ilosc].to_i
    ilosc = 1 if ilosc <= 0

    if @koszyk.zawartosc_koszyka.include?(params[:wariant])
      @koszyk.dodaj_do_koszyka(merge_hash: { params[:wariant] => (ilosc + @koszyk.ile_sztuk(wariant: params[:wariant])) })
    else
      @koszyk.dodaj_do_koszyka(merge_hash: { params[:wariant] => ilosc })
    end

    cookies[:koszyk] = JSON.generate(@koszyk.zawartosc_koszyka)
  end



  def cart_remove_from
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))
    
    @koszyk.usun_z_koszyka(wariant: params[:wariant])
    
    cookies[:koszyk] = JSON.generate(@koszyk.zawartosc_koszyka)

    @volumes = Volume.where(id: @koszyk.klucze)
  end



  def cart_empty
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))
    
    @koszyk.oproznij_koszyk

    cookies[:koszyk] = JSON.generate(@koszyk.zawartosc_koszyka)

    @volumes = Volume.where(id: @koszyk.klucze)
  end
end
