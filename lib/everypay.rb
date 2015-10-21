# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

require 'rest-client'
require 'json'

require 'everypay/resource'
require 'everypay/payment'
require 'everypay/customer'

module Everypay

  @test = false
  @verify_ssl = true
  @api_uri = 'https://api.everypay.gr'
  @sandbox_uri = 'https://sandbox-api.everypay.gr'

  class << self
    attr_accessor :api_key, :test, :verify_ssl
    attr_reader   :api_uri, :sandbox_uri
  end

  def self.test?
    @test == true
  end

  def self.uri
    test? ? @sandbox_uri : @api_uri
  end
end
