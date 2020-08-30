class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @filter = params[:filter]
    page = params[:page]
    per = 6

    if params[:search_kod]
      search_kod = '%' + params[:search_kod] + '%'
      @products = ProductsSearchService.call(locale: params[:locale], search_kod: search_kod, page: page, per: per)
    else
      @products = FilterRouteService.call(@filter, page, per)
    end
  end

  def show
    @product = Product.find(params[:id])
    @volumes = @product.volumes.all.order(pojemnosc: :desc)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(params[:locale], @product)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to product_path(params[:locale], @product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:kod, :tytul, :poziom, :kategoria, :ekstra_geste, :geste, :rzadkie, :uniwersalne, :z_ptfe, :z_mos2, :z_grafitem, :biale, :do_lozysk, :do_bram, :do_dzwigow, :do_lancuchow, :do_gumy, :do_rowerow, :do_zamkow, :grafitowo_molibdenowe, :oleje_precyzyjne_lekkie, :dla_rolnictwa_i_lesnictwa, :ochrona_przylaczy, :kontakt_spray, :super_izolator, :zmywacz, :olej_elektroserwisowy, :pasty_miedziane, :ekstra_geste_miedziane, :pasty_ceramiczne, :ekstra_geste_ceramiczne, :pasty_aluminiowe, :plyny_do_ciecia, :oleje_do_gwintowania, :pasty_do_gwintowania, :odtluszczacz_maszynowy, :zmywacz_serwisowy, :zmywacz_smarujacy, :zmywacz_konserwujacy, :olej_ochronny, :wosk_ochronny, :pasta_ochronna, :pasta_do_baterii, :ekstra_gesta_pasta_do_baterii, :wapniowe, :smar_plynny, :smar_polsuchy, :polsuche_srodki_smarne, :oleje_wysokoczepne, :smary_pelzajace, :plyn_do_oringu, :pasta_do_oringu, :ekstra_gesta_pasta_do_oringu, :spraye_rowerowe, :zmywacze_rowerowe, :litowe, :do_wysiegnikow_alu, :miniatura, :opis_krotki, :opis_dlugi, :tytul_en, :opis_krotki_en, :opis_dlugi_en, :tytul_de, :opis_krotki_de, :opis_dlugi_de, :tytul_se, :opis_krotki_se, :opis_dlugi_se, :tytul_ru, :opis_krotki_ru, :opis_dlugi_ru)
  end
end
