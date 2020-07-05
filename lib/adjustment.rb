class Adjustment
  attr_accessor :offer_code, :discount

  def initialize(offer_code, discount)
    @offer_code = offer_code
    @discount = discount
  end
end
