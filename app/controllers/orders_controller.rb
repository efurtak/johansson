class OrdersController < ApplicationController
  def prepare
    @message = Message.new
  end

  def send_message
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))
    @volumes = Volume.where(id: @koszyk.klucze)

    @imie_i_nazwisko = params[:message][:imie_i_nazwisko]
    @email = params[:message][:email]
    @komentarz = params[:message][:komentarz]

    if @koszyk.ile_w_koszyku > 0
      OrderMailer.with(koszyk: @koszyk.zawartosc_koszyka, volumes: @volumes.as_json, imie_i_nazwisko: @imie_i_nazwisko, email: @email, komentarz: @komentarz).order_email.deliver_later
    end
       
    @koszyk.oproznij_koszyk
    
    cookies[:koszyk] = JSON.generate(@koszyk.zawartosc_koszyka)
  end
end
