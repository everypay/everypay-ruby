# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Payment < Resource

    def self.create payload
      super
    end

    def self.capture token
      invoke :put, {:token => token}
    end

    def self.resource
      'payments'
    end

  end

end
