class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:amount].to_float * 100,
      :description => 'Strategic HR Course Certificate',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
end
