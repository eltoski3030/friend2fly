class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_destination, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @destinations = params[:destination_id].present? ? [Destination.find(params[:destination_id])] : Destination.all
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

  def edit
    # @destination is already set by set_destination
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
    params.require(:destination).permit(:name, :description)
  end
end
