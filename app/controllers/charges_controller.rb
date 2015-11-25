  class ChargesController < ApplicationController

def new
  @reservation = Reservation.new

  #parking params for parking quantity, checkin, checkout, and address
  @cust = params[:result_id]
  @user_id = @current_user.id
  @address = Property.all.where(:id => @cust)[0].address
  @property_id = Property.all.where(:id => @cust)[0].id
  @custCheckin = params[:checkin]
  @custCheckout = params[:checkout]
  @custPkgQty = params[:parking_quantity]

end

def create
  cust = params[:result_id]
  user_id = @current_user.id
  property_id = params[:property_id]
  custCheckin = Chronic.parse(params[:checkin]).to_datetime if params[:checkin]
  custCheckout = Chronic.parse(params[:checkout]).to_datetime if params[:checkout]
  custPkgQty = params[:parking_quantity]
  
  if params[:checkin] && params[:checkout]
    Reservation.create!(
        checkin: custCheckin, 
        checkout: custCheckout, 
        property_id: property_id, 
        user_id: user_id)
  end
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
    redirect_to new_result_charge_path
  end

end
