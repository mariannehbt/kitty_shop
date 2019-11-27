class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:secret]

  def index
  end

  def secret
  end

  def pay_form
      Stripe.api_key = 'sk_test_2zBjaF61cnAze1NjvkRw4ADH00dcldeKWO'

  @intent = Stripe::PaymentIntent.create({
      amount: 1099,
      currency: 'eur',
  })
  end
end
