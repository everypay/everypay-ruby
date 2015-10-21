# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Payment < Resource

    def self.create payload
      super
    end

    def self.capture token
      invoke(:put, {:namespace => 'capture', :token => token})
    end

    def self.refund token, payload={}
      payload.merge! :namespace => 'refund', :token => token
      invoke :put, payload
    end

    def self.resource
      'payments'
    end

  end

end
