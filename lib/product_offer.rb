class ProductOffer
  attr_accessor :offer_code

  def initialize(offer_code)
    @offer_code = offer_code
  end

  def apply(line_items)
    case offer_code
    when 'BOGO'
      apply_bogo(line_items)
    when 'APPL'
      apply_appl(line_items)
    when 'CHMK'
      apply_chmk(line_items)
    when 'APOM'
      apply_apom(line_items)
    end
  end


  private

  def apply_bogo(line_items)
    coffee = Product.all_products.detect { |product| product.code == 'CF1' }

    coffee_items = line_items.select { |line_item| line_item.product == coffee }

    free_items_count = coffee_items.count/2
    if free_items_count > 0
      adjustment = Adjustment.new('BOGO', coffee.price)
      coffee_items.last(free_items_count).each do |line_item|
        line_item.adjustments << adjustment
      end
    end
  end

  def apply_appl(line_items)
    apple = Product.all_products.detect { |product| product.code == 'AP1' }

    apple_items = line_items.select { |line_item| line_item.product == apple }

    if apple_items.count > 2
      adjustment = Adjustment.new('APPL', 1.5)
      apple_items.each do |line_item|
        line_item.adjustments << adjustment
      end
    end
  end

  def apply_chmk(line_items)
    chai = Product.all_products.detect { |product| product.code == 'CH1' }
    milk = Product.all_products.detect { |product| product.code == 'MK1' }

    chai_items = line_items.select { |line_item| line_item.product == chai }
    milk_items = line_items.select { |line_item| line_item.product == milk }

    if chai_items.count > 0 and milk_items.count > 0
      adjustment = Adjustment.new('CHMK', milk.price)
      milk_items.last.adjustments << adjustment
    end
  end

  def apply_apom(line_items)
    apple = Product.all_products.detect { |product| product.code == 'AP1' }
    oatmeal = Product.all_products.detect { |product| product.code == 'OM1' }

    apple_items = line_items.select { |line_item| line_item.product == apple }
    oatmeal_items = line_items.select { |line_item| line_item.product == oatmeal }

    adjustment_count = (oatmeal_items.count >= apple_items.count) ? apple_items.count : oatmeal_items.count
    if adjustment_count > 0
      apple_items.last(adjustment_count).each do |line_item|
        discounted_price = line_item.product.price - line_item.adjustments.inject(0) { |sum, adjustment| sum += adjustment.discount }
        adjustment = Adjustment.new('APOM', discounted_price/2.0)
        line_item.adjustments << adjustment
      end
    end
  end
end
