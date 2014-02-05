class ChargesController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @amount = @course.price
  end

  def create
    @course = Course.find(params[:course_id])
    @amount = (@course.price * 100).to_i
    @ceu = Ceu.find(params[:ceu][:id])

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Strategic HR Course Certificate',
      :currency    => 'usd'
    )
    @certificate = Certificate.create(course_id: @course.id,
                                      user_id: current_user.id,
                                      purchase_date: Time.now,
                                      purchase_price: @amount/100.0,
                                      ceu_id: @ceu.id)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
end
