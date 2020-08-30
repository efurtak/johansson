class ProductsSearchService
  def self.call(locale:, search_kod:, page:, per:)
    case locale
    when 'pl'
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    when 'en'
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul_en LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    when 'de'
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul_de LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    when 'se'
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul_se LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    when 'ru'
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul_ru LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    else
      Product.where('kod LIKE ?', search_kod).or(Product.where('tytul LIKE ?', search_kod.upcase)).order(kod: :desc).page(page).per(per)
    end
  end
end