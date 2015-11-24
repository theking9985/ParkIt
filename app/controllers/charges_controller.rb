class ChargesController < ApplicationController

def new

  #parking params for parking quantity, checkin, checkout, and address
  @custAddress = params[:city]
  @custCheckin = params[:checkin]
  @custCheckout = params[:checkout]
  @custPkgQty = params[:parking_quantity]
end

def create
  # $10 with amount in cents
  @amount = 1000

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'ParkIt customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
