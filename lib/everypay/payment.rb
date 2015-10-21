# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Payment < Resource

    class << self
      def create payload
        super
      end

      def capture token
        invoke(:put, {:namespace => 'capture', :token => token})
      end

      def refund token, payload={}
        payload.merge! :namespace => 'refund', :token => token
        invoke :put, payload
      end

      def resource
        'payments'
      end
    end

  end

end
