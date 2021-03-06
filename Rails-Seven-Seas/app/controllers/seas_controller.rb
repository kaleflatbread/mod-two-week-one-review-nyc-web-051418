class SeasController < ApplicationController
  #define your controller actions here
  def welcome
  end

  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new(params[:sea])
  end

  def create
    @sea = Sea.create(sea_params)
    #  byebug
    redirect_to sea_path(@sea.id), :notice => "sea has been created"
  end


  def show
    # byebug
    @sea = Sea.find_by(id: params[:id])
  end

  def edit
     # byebug
    @sea = Sea.find_by(id: params[:id])
  end

  def update
    @sea = Sea.find_by(id: params[:id])
    if @sea.update_attributes(sea_params)
      redirect_to sea_path, :notice => "sea has been updated"
    else
      render :edit
    end
  end

  def destroy
    @sea = Sea.find_by(id: params[:id])
    @sea.delete
    redirect_to :action => :index
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids, :wave_height)
  end


end
