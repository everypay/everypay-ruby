# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Customer < Resource

    class << self
      def create payload
        super
      end

      def update token, payload
        super
      end

      def delete token
        super
      end

      def resource
        'customers'
      end
    end

  end

end
