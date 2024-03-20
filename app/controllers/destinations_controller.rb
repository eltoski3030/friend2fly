class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_destination, only: [:edit, :update, :destroy, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  
  def index
    @destinations = Destination.all
    
    @destinations = @destinations.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
    @destinations = @destinations.where("description LIKE ?", "%#{params[:description]}%") if params[:description].present?
    @destinations = @destinations.where("budget <= ?", params[:max_budget].to_f) if params[:max_budget].present?
  
    if params[:start_date].present? && params[:end_date].present?
      @destinations = @destinations.where(travel_date: params[:start_date]..params[:end_date])
    end
  
    @destinations = @destinations.where("duration = ?", params[:duration].to_i) if params[:duration].present?
  end
  

    def new
      @destination = Destination.new
    end


  def create
    @destination = current_user.destinations.build(destination_params)
    if @destination.save
      redirect_to destinations_path, notice: 'Destination successfully added.'
    else
      render :new
    end
  end

  def show
    
    @comments = @destination.comments.where(parent_id: nil) 
    @comment = Comment.new 
  end

  def edit
    
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination, notice: 'Destination successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path, notice: 'Destination was successfully deleted.'
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def check_user
    redirect_to root_path, alert: "You are not authorized to modify this destination" unless @destination.user == current_user
  end

  def destination_params
    params.require(:destination).permit(:city, :country, :description, :budget, :date, :duration)
  end
  
  def upvote
    @destination = Destination.find(params[:id])
    vote = Vote.find_or_initialize_by(destination: @destination, user: current_user)
    
    if vote.new_record? || vote.value != 1
      vote.value = 1
      vote.save
      redirect_to @destination, notice: 'Thanks for your vote!'
    else
      redirect_to @destination, alert: 'You have already upvoted this destination.'
    end
  end
  
  def downvote
    @destination = Destination.find(params[:id])
    vote = Vote.find_or_initialize_by(destination: @destination, user: current_user)
    
    if vote.new_record? || vote.value != -1
      vote.value = -1
      vote.save
      redirect_to @destination, notice: 'Your vote has been recorded.'
    else
      redirect_to @destination, alert: 'You have already downvoted this destination.'
    end
  end
  
end

