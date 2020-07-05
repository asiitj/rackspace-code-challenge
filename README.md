(Asumptions: Multiple offers can be applicalble to a line item in cart and 'APPL' has priority over 'APOM')

(Code Tested on Ruby Version 2.6.3)

To run the code:

1. Install Ruby (Version 2.6.x Recommended) on the machine
2. Open Ruby Interpreter by using command `irb` in the root directory of code
3. Run command `load './lib/run.rb'` inside interpreter
4. Now create new cart by creating new instance of class `Cart`, `cart = Cart.new`
5. Add product to cart by calling `cart.add('CH1')`, `cart.add('AP1')`, `cart.add('OM1')`...
6. To print current register at any point of time call `cart.print`
7. To run unit test cases type `ruby tests/cart_unit_test.rb` in root directory
