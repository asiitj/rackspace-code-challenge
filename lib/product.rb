class Product
  @@all_products = []
  attr_accessor :name, :code, :price, :offers

  def initialize(product_name, product_code, product_price, offers = [])
    @name = product_name
    @code = product_code
    @price = product_price
    @offers = offers
    @@all_products << self
  end

  def self.all_products
    @@all_products
  end
end
