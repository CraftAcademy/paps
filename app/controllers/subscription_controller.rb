class SubscriptionController < ApplicationController

  def new
  end

  def create
    # 1. Create a customer with Stripe
    # 2. Create a charge for that customer
    # 3. If charge is okay, update the user status to subscriber = true
    # 4. Flash "Welcome as a subscriber!" and redirect to root path

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
    else
      redirect_to new_subscription_path, notice: 'WTF?'
    end
  end

end
