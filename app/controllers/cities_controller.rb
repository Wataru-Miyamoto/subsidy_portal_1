class CitiesController < ApplicationController
  def import
    City.import(params[:file])
    redirect_to prefs_url
  end
end
