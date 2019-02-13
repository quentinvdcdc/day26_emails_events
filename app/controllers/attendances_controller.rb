class AttendancesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :index]
	def index
		@event = Event.find(params[:event_id]) 
	end
	def new
		@event = Event.find(params[:event_id])
		@attendance = Attendance.new
	end
	def create
		#@attendance = Attendance.new(stripe_customer_id: , attendee: current_user, event: Event.find(params[:event_id])
  	# Amount in cents
  	@event = Event.find(params[:event_id])
  	@amount = @event.price * 100

  	customer = Stripe::Customer.create(
    	:email => params[:stripeEmail],
    	:source  => params[:stripeToken]
  	)

  	charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description => 'Rails Stripe customer',
    	:currency    => 'eur'
  	)

  	puts "le customer c'est machin chose"
  	puts charge[:customer]

	#rescue Stripe::CardError => e
  	#flash[:error] = e.message
  	#redirect_to new_charge_path

		@attendance = Attendance.new(stripe_customer_id: charge[:customer], attendee: current_user, event: @event)
		if @attendance.save
			# si ça marche, il redirige vers la page d'index du site
  		flash[:success] = "Oh ça va être bat comme on disait d'antan !" #hash depuis l'application.html.erb
    	redirect_to event_path(@event.id)
  	else
  	  	# sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	  flash[:danger] = "Meh si tu payes pas, comment on va s'enrichir, nous ?" #idem
  		render 'new'
  	end
	end
end
