class ShapesController < ApplicationController
  before_action :set_shape, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shapes = Shape.all
    respond_with(@shapes)
  end

  def show
    respond_with(@shape)
  end

  def new
    @shape = Shape.new
    respond_with(@shape)
  end

  def edit
  end

  def create
    @shape = Shape.new(shape_params)
    @shape.save
    respond_with(@shape)
  end

  def update
    @shape.update(shape_params)
    respond_with(@shape)
  end

  def destroy
    @shape.destroy
    respond_with(@shape)
  end

  private
    def set_shape
      @shape = Shape.find(params[:id])
    end

    def shape_params
      params.require(:shape).permit(:name, :A, :B, :C, :diameter, :thickness, :width, :length, :image)
    end
end
