# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Resource

    class << self

      def create payload
        invoke :post, payload
      end

      def retrieve token
        invoke :get, {:token => token}
      end

      def list filters={}
        invoke :get, filters
      end

      def update token, payload
        payload.merge! :token => token
        invoke :put, payload
      end

      def delete token
        invoke :delete, {:token => token}
      end

      protected

      def resource
        raise NotImplementedError.new('resource method must return a resource name ex payment, customer, token etc')
      end


      def invoke method, payload={}
        url = endpoint
        url = url + '/' + payload[:namespace] if payload[:namespace]
        url = url + '/' + payload.delete(:token) if payload[:token]

        p url.inspect
        opts = {:method => method,
                :verify_ssl => Everypay.verify_ssl,
                :url => url,
                :user => Everypay.api_key}
        request opts, payload
      end

      private

      def endpoint
        Everypay.uri + '/' + resource
      end

      def request opts, payload
        opts[:payload] = payload
        response = nil
        begin
          response = RestClient::Request.execute opts
        rescue RestClient::ExceptionWithResponse => e
          response = e.response if e.response
        rescue RestClient::SSLCertificateNotVerified => e
          response = JSON.generate({:error => {:code => 400, :status=>400, :message => e.message}})
        end

        hash = JSON.parse response
      end

    end

  end

end
