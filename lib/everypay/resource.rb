# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Resource

    def self.create payload
      invoke :post, payload
    end

    def self.retrieve token
      invoke :get, {:token => token}
    end

    def self.list filters={}
      invoke :get, filters
    end

    def self.update token, payload
      payload[:token] = token
      invoke :put, payload
    end

    def delete token
      invoke :delete, {:token => token}
    end

    protected

    def self.resource
      raise NotImplementedError.new('resource method must return a resource name ex payment, customer, token etc')
    end


    def self.invoke method, payload={}
      url = endpoint
      url = url + '/' + payload[:token] if payload[:token]
      opts = {:method => method,
              :verify_ssl => Everypay.verify_ssl,
              :url => url,
              :user => Everypay.api_key}
      request opts, payload
    end

    private

    def self.endpoint
      Everypay.uri + '/' + resource
    end

    def self.request opts, payload
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
