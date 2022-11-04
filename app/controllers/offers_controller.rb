class OffersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @offer = Offer.new
    @camera = Camera.find(params[:camera_id])
  end

  def create
    @offer = Offer.new
    @offer.camera = @camera
    @user = current_user.id
    @camera = Camera.find(params[:camera_id])

    if @offer.save

      redirect_to camera_path(@camera)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def offers_params
    params.require(:offer).permit(:camera_id, :user_id)
  end
end
