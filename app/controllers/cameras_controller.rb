class CamerasController < ApplicationController
  def index
    @cameras = Camera.all
  end

  def show
    @camera = Camera.find(params[:id])
  end

  def new
    @camera = Camera.new
  end

  def create
    @user_id = current_user.id
    raise

    @camera = Camera.new(camera_params)
    if @camera.save
      redirect_to @camera, notice: "Your camera was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def camera_params
    params.require(:camera).permit(:name, :location, :price)
  end
end
