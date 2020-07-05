require_relative '../lib/run.rb'
require 'test/unit'

class TestCart < Test::Unit::TestCase
  def test1
    cart = Cart.new
    cart.add('CH1')
    cart.add('AP1')
    cart.add('CF1')
    cart.add('MK1')
    assert_equal(20.34, cart.total_amount)
  end

  def test2
    cart = Cart.new
    cart.add('MK1')
    cart.add('AP1')
    assert_equal(10.75, cart.total_amount)
  end

  def test3
    cart = Cart.new
    cart.add('CF1')
    cart.add('CF1')
    assert_equal(11.23, cart.total_amount)
  end

  def test4
    cart = Cart.new
    cart.add('AP1')
    cart.add('AP1')
    cart.add('CH1')
    cart.add('AP1')
    assert_equal(16.61, cart.total_amount)
  end

  def test5
    cart = Cart.new
    cart.add('CH1')
    cart.add('AP1')
    cart.add('AP1')
    cart.add('AP1')
    cart.add('MK1')
    assert_equal(16.61, cart.total_amount)
  end

  def test6
    cart = Cart.new
    cart.add('CH1')
    cart.add('AP1')
    cart.add('AP1')
    cart.add('AP1')
    cart.add('MK1')
    cart.add('OM1')
    assert_equal(18.05, cart.total_amount)
  end
end
