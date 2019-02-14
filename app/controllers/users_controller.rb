class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update]
	before_action :authenticate_correct_user, only: [:show, :edit, :update]

	def show
		@user = User.find(params[:id])
		@events = Event.where(administrator: @user) 
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
		  flash[:success] = "Profile saved !"
      redirect_to root_path
    else
      flash[:danger] = "Non, ton profil n'est pas sauvegardé !"
      render :edit
    end
	end

	private

	def authenticate_correct_user
    unless current_user == User.find(params[:id])
      flash[:danger] = "Stalking Alert, the 'L' is Silent"
      redirect_to root_path
    end
  end
end
