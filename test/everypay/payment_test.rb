# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:

require File.expand_path('../../test_helper', __FILE__)

module Everypay

  class PaymentTest < Test::Unit::TestCase

    def test_payment_retrieve
      token = 'pmt_4KQ2DD15gs2w8RS4M2MhBz1Q'
      Payment.expects(:invoke).returns(success_payment_retrieve_response)
      payment = Payment.retrieve token
      assert_payment_attributes payment
    end

    def test_payment_create
      Payment.expects(:invoke).returns(success_payment_create_response)
      payload = {:amount => 1000,
                 :capture => 0,
                 :card_number => '4111111111111111',
                 :expiration_month => 01,
                 :expiration_year => 2016,
                 :cvv => 123,
                 :holder_name => 'John Doe'}
      payment = Payment.create payload

      assert_payment_attributes payment
      assert_equal 'Captured', payment['status']
    end

    def success_payment_retrieve_response
      JSON.parse '{ "token": "pmt_4KQ2DD15gs2w8RS4M2MhBz1Q", "date_created": "2015-07-06T18:05:01+0300", "description": "payment for item #222", "currency": "EUR", "status": "Captured", "amount": 50, "refund_amount": 0, "fee_amount": 21, "payee_email": null, "payee_phone": null, "refunded": false, "refunds": [], "card": { "expiration_month": "10", "expiration_year": "2017", "last_four": "9610", "type": "Visa", "holder_name": "John Doe" } }'
    end

    def success_payment_create_response
      JSON.parse '{ "token": "pmt_guLEyWbxfj9zosdIeyUIWOWP", "date_created": "2015-07-08T18:05:50+0300", "description": null, "currency": "EUR", "status": "Captured", "amount": 100, "refund_amount": 0, "fee_amount": 22, "payee_email": null, "payee_phone": null, "refunded": false, "refunds": [], "card": { "expiration_month": "01", "expiration_year": "2016", "last_four": "1111", "type": "Visa", "holder_name": "John Doe" } }'
    end

    def assert_payment_attributes payment
      assert_boolean true, payment.key?('token')
      assert_boolean true, payment.key?('status')
      assert_boolean true, payment.key?('amount')
      assert_boolean true, payment.key?('fee_amount')
    end
  end

end
