# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

require 'everypay'
require 'test/unit'
require 'mocha/setup'
require 'json'

class Test::Unit::TestCase
  include Mocha

  setup do
    Everypay.api_key="foo"
  end

  teardown do
    Everypay.api_key=nil
  end
end
