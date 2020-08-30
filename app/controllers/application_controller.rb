class ApplicationController < ActionController::Base
  before_action :odczytaj_koszyk
  before_action :set_locale

  private

  def odczytaj_koszyk
    cookies[:koszyk] = JSON.generate({}) if cookies[:koszyk].nil?
    @koszyk = KoszykService.new(koszyk_hash: JSON.parse(cookies[:koszyk]))
  end

  def set_locale
    I18n.locale = params[:locale] || 'pl'
  end
end
