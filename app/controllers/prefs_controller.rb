class PrefsController < ApplicationController
  def index
    @prefs = Pref.all.paginate(page: params[:page])
  end

  def show
    @pref = Pref.find(params[:id])
  end

  def import
    Pref.import(params[:file])
    redirect_to prefs_url
  end

  def admin_index
    @prefs = Pref.all.paginate(page: params[:page])
  end

  # Ajax処理を行う処理
  def cities_select
    if request.xhr?
      render partial: 'cities', locals: {pref_id: params[:pref_id]}
    end
  end
end
