class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_administrator, only: [:edit, :update, :destroy]
  def index
  end
  def show
    @event = Event.find(params[:id])
    puts @event.title
  end
	def new
    @event = Event.new
	end
	def create
  	@event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], administrator: current_user, price: params[:price], location: params[:location])
  	if @event.save # essaie de sauvegarder en base @gossip
  	  # si ça marche, il redirige vers la page d'index du site
  	  #flash[:success] = "Oh le beau event !" #hash depuis l'application.html.erb
  	  redirect_to root_path
  	else
  	  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	  #flash[:danger] = "Meh sans balloon c'est pas un vrai event" #idem
  	  render 'new'
  	end
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], administrator: @event.administrator, price: params[:price], location: params[:location])
      flash[:success] = "Modification saved !"
      redirect_to root_path
    else
      flash[:danger] = "Non modification pas sauvegardée !"
      render :edit
    end
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private 

  def authenticate_administrator
    @event = Event.find(params[:id])
    if current_user == @event.administrator
      true
    else
      false
    end
  end
end
