# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

module Everypay

  class Payment < Resource

    class << self

      # Create a new payment.
      #
      # Available payload parameters are:
      # - amount: The amount in cents for the payment. [Required]
      #
      # For direct payment with credit / debit cards, card info are required.
      # - card_number:       A valid credit /debit card number. [Required]
      # - expiration_month:  Integer representation of month. [Required]
      # - expiration_year:   Integer represantation of a valid expiration year. [Required]
      # - cvv:               Card verification value. Three or four (American express) digits. [Required]
      # - holder_name:       First and last name of the card holder. [Required]
      #
      # For payments with card token, a valid card token required. Card tokens
      # can be obtained from Token::create api calls.
      # - token [Required].
      #
      # Optional params.
      # - currency:         The ISO 4217 code currency used for this payment. [Optional]
      # - description:      A decription for this payment max 255 chars. [Optional]
      # - payee_email:      Customer email. [Optional]
      # - payee_phone:      Customer phone number. [Optional]
      # - capture:          Integer Whether to capture a payment or just authorize it.
      #                     To authorize a payment this value must be 0.
      # - create_customer:  Integer(0,1) Whether to create a customer and store its
      #                     card or not.
      # - installments:     Integer(0,1) The number of installments for this payment.
      #                     Can only be used for credit card payments.
      # - max_installments: Integer Used for payments with token, to validate
      #                     max installments set by the merchant from
      #                     everypay Button.
      #
      def create payload
        super
      end

      def capture token
        invoke(:put, {:namespace => 'capture', :token => token})
      end

      # Refund a payment.
      #
      # Available payload parameters are:
      #   - amount:       The amount to refund. The amount must not exceed the maximum
      #                   amount of Payment. Can be used for partial refunds. If ommited
      #                   then a full refund will be created. [Optional]
      #   - description:  A description for this refund max 255 chars. [Optional]
      #
      def refund token, payload={}
        payload.merge! :namespace => 'refund', :token => token
        invoke :put, payload
      end

      def update token, payload
        raise NotAvailableMethodError.new("resource #{resource} does not support #{__method__} method.")
      end

      def delete token
        raise NotAvailableMethodError.new("resource #{resource} does not support #{__method__} method.")
      end

      protected

      def resource
        'payments'
      end
    end

  end

end
