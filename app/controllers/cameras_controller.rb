class CamerasController < ApplicationController
  def index
    @cameras = Camera.all
  end

  def show
  end

  def new
  end

  def create
  end
end
