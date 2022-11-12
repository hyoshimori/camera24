class OffersController < ApplicationController
  def index
    # @offers = Offer.joins(:camera).where("offers.user_id = :query OR cameras.user_id = :query", query: current_user.id)
    @other_offers = Offer.joins(:camera).where("cameras.user_id = :query", query: current_user.id)
    @my_offers = Offer.where(user_id: current_user)
    # @other_bookings = Offer.where.not(user_id: current_user)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @camera = Camera.find(params[:camera_id])
  end

  def create
    @offer = Offer.new
    @camera = Camera.find(params[:camera_id])
    @offer.camera = @camera
    @offer.user = current_user
    if @offer.save
      redirect_to camera_path(@camera)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offers_params)
    redirect_to offer_path(@offer)
  end

  private

  def offers_params
    params.require(:offer).permit(:camera_id, :user_id, :status)
  end
end
