class PrefsController < ApplicationController
  def index
    @prefs = Pref.all
  end

  def show
    @pref = Pref.find(params[:id])
  end

  def import
    Pref.import(params[:file])
    redirect_to prefs_url
  end
end
