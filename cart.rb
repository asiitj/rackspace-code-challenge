class Cart
  attr_accessor :line_items, :total_amount

  def initialize
    @line_items = []
    @total_amount = 0.0
  end

  def add(product_code)
    product = Product.all_products.detect { |product| product.code == product_code }
    unless product.nil?
      line_items << LineItem.new(product)
      reset_adjustments
      calculate_adjustments
      @total_amount = line_items.inject(0) { |sum, line_item| sum += (line_item.product.price-line_item.adjustments.inject(0) { |sum, adjustment| sum += adjustment.discount }) }
    else
      puts "Incorrect Product Code!"
    end
  end

  def print_cart
    puts <<-TITLE
    Item                          Price
    ----                          -----
    TITLE
    line_items.each do |line_item|
      puts "    #{line_item.product.code}                           #{line_item.product.price}"
      line_item.adjustments.each do |adjustment|
        puts "                #{adjustment.offer_code}              -#{adjustment.discount}"
      end
    end
    puts <<-FOOTER
    -----------------------------------
    FOOTER
    puts "                                  #{total_amount}"
  end

  private

  def reset_adjustments
    line_items.each { |line_item| line_item.adjustments = [] }
  end

  def calculate_adjustments
    uniq_items = []
    line_items.each do |line_item|
      product = line_item.product
      unless uniq_items.include? product.code
        uniq_items << product.code
        product.offers.each do |offer|
          offer.apply(line_items)
        end
      end
    end
  end
end
