require_relative './product.rb'
require_relative './product_offer.rb'
require_relative './adjustment.rb'
require_relative './line_item.rb'
require_relative './cart.rb'

# Data Creation
bogo = ProductOffer.new('BOGO')
appl = ProductOffer.new('APPL')
chmk = ProductOffer.new('CHMK')
apom = ProductOffer.new('APOM')

Product.new('Chai', 'CH1', 3.11, [chmk])
Product.new('Apples', 'AP1', 6.00, [appl, apom])
Product.new('Coffee', 'CF1', 11.23, [bogo])
Product.new('Milk', 'MK1', 4.75)
Product.new('Oatmeal', 'OM1', 3.69)
