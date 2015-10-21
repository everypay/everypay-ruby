# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Customer < Resource

    class << self

      # Create a new customer.
      #
      # Available payload parameters are:
      #
      # For customers from credit / debit cards, card info are required.
      #   - card_number:      A valid credit /debit card number. [Required]
      #   - expiration_month: Integer representation of month. [Required]
      #   - expiration_year:  Integer represantation of a valid expiration year. [Required]
      #   - cvv:              Card verification value. Three or four (American express) digits. [Required]
      #   - holder_name:      First and last name of the card holder. [Required]
      #
      # For customers from card token, a valid card token required. Card tokens
      # can be obtained from Token::create api calls.
      #   - token [Required].
      #
      # Optional params.
      #   - description:  A decription for this customer max 255 chars. [Optional]
      #   - email:        Customer email. [Optional]
      #   - full_name:    Customer full name. [Optional]
      def create payload
        super
      end

      def update token, payload
        super
      end

      def delete token
        super
      end

      protected

      def resource
        'customers'
      end
    end

  end

end
