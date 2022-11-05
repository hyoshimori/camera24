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
    @camera = Camera.new(camera_params)
    @camera.user = current_user
    if @camera.save!
      redirect_to @camera, notice: "Your camera was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    camera = Camera.find(params[:id])
    camera.update(camera_params)
    redirect_to camera_path(camera)
  end

  def destroy
    camera = Camera.find(params[:id])
    camera.destroy
    redirect_to cameras_path
  end

  private

  def camera_params
    params.require(:camera).permit(:name, :location, :price)
  end
end
