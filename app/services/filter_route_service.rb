class FilterRouteService
  def self.call(filter, page, per)
    begin
      Product.public_send(filter).page(page).per(per)
    rescue NoMethodError
      Product.public_send('wszystkie').page(page).per(per)
    end
  end
end