# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Token < Resource

    class << self

      # Create a new card token.
      #
      # Available payload parameters are a valid card info data.
      #   - card_number:       A valid credit /debit card number. [Required]
      #   - expiration_month:  Integer representation of month. [Required]
      #   - expiration_year:   Integer represantation of a valid expiration year. [Required]
      #   - cvv:               Card verification value. Three or four (American express) digits. [Required]
      #   - holder_name:       First and last name of the card holder. [Required]
      #
      def create payload
        super
      end

      def update token, payload
        raise NotAvailableMethodError.new("resource #{resource} does not support #{__method__} method.")
      end

      def delete token
        raise NotAvailableMethodError.new("resource #{resource} does not support #{__method__} method.")
      end

      def list filters={}
        raise NotAvailableMethodError.new("resource #{resource} does not support #{__method__} method.")
      end

      protected

      def resource
        'tokens'
      end
    end

  end

end
