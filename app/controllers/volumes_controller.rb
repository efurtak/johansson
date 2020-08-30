class VolumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  
  def new
    @product = Product.find(params[:product_id])
    @volumes = @product.volumes.all
    @volume = @product.volumes.new
  end

  def edit
    @product = Product.find(params[:product_id])
    @volumes = @product.volumes.all
    @volume = @product.volumes.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @volume = @product.volumes.new(volume_params)

    if @volume.save
      redirect_to product_path(params[:locale], @product.id)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @volume = @product.volumes.find(params[:id])

    if @volume.update(volume_params)
      redirect_to product_path(params[:locale], @product.id)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @volume = @product.volumes.find(params[:id])

    @volume.destroy
    redirect_to product_path(params[:locale], @product.id)
  end

  private

  def volume_params
    params.require(:volume).permit(:pojemnosc, :cena, :waluta)
  end
end
