class CitiesController < ApplicationController

  def index
    @pref = Pref.find(params[:pref_id])
    @cities = City.where(pref_id: @pref.id).paginate(page: params[:page])
  end

  def admin_index
    @pref = Pref.find(params[:pref_id])
    @cities = City.where(pref_id: @pref.id).paginate(page: params[:page])
  end

  def import
    pref = Pref.find(params[:pref_id])
    City.import(params[:file])
    redirect_to pref_cities_url(pref)
  end
end
