class CitiesController < ApplicationController

  def index
    @pref = Pref.find(params[:pref_id])
    @cities = City.where(pref_id: @city.id)
  end

  def import
    City.import(params[:file])
    redirect_to prefs_url
  end
end
