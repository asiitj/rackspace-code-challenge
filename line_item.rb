class LineItem
  attr_accessor :product, :adjustments

  def initialize(product)
    @product = product
    @adjustments = []
  end
end
