class SubscriptionController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 1000,
      description: 'Subscription to PAPS News',
      currency: 'sek'
    )

    if charge.paid?
      current_user.subscriber = true
      current_user.save
      redirect_to root_path, notice: 'Welcome as a subscriber!'
    end
  end
end
