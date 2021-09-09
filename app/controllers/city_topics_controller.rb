class CityTopicsController < ApplicationController
  def new
    @pref = Pref.find(params[:pref_id])
    @city = City.find(params[:city_id])
    @city_topic = CityTopic.new
  end

  def edit
  end

  def show
  end

  def index
  end
end
