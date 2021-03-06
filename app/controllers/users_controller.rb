class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :admin_post]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :admin_post]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy, :admin_post]
  before_action :admin_or_correct_user, only: [:show, :edit, :update]
  
  def index
    @user = User.search(params[:search])
    @title = "ユーザー一覧"
      if params.has_key?(:search)
        @title = "検索結果"
      end
    @users = User.paginate(page: params[:page])
  end
  
  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit  
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def admin_post
    @gov_topic = GovTopic.new
    @prefs = Pref.all
    @pref_topic = PrefTopic.new
    @cities = Pref.all
    @city_topic = CityTopic.new
  end

  def admin_pref_topic_post
  end



  def admin_city_topic_post
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def admin_or_correct_user
    @user = User.find(params[:id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "アクセス権限がありません。"
        redirect_to(root_url)
      end
    end
end
