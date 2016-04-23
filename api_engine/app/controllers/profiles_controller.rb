class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    
    unless @profile == current_user.profile
      redirect_to :back, :alert => "Access denied."
    end
  end

  def new
    
  end
  
  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private 

end