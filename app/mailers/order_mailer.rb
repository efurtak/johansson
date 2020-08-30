class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def order_email
    @koszyk = params[:koszyk]
    @volumes = params[:volumes]        

    @imie_i_nazwisko = params[:imie_i_nazwisko]
    @email = params[:email]
    @komentarz = params[:komentarz]

    mail(to: 'adres@zamowienia.pl', subject: "Zamówienie od #{@imie_i_nazwisko}")
  end
end
