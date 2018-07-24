class RegionController < ApplicationController
  before_action :set_region

  def create
    Region.create(region_params)
    redirect_to new_tag_path
  end

  def update
    @region.update(region_params)
    redirect_to new_tag_path
  end

  def destroy
    @region.destroy
    redirect_to new_tag_path
  end

  private

  def set_region
    @region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :type)
  end
end
