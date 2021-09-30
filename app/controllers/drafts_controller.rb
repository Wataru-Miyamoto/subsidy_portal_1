class DraftsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @drafts = current_user.admin? ? Draft.all : Draft.where(user_id: @user.id)
    #@draft = Draft.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @draft = @user.drafts.new
  end

  def create
    @user = User.find(params[:user_id])
    @draft = @user.drafts.new(draft_params)
    if @draft.save
      flash[:success] = '投稿を送信しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿の送信ができませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:user_id])
    @draft = @user.drafts.find(params[:id])
    if @draft.update_attributes!(draft_params)
      @draft.update(draft_status: "更新申請中です")
      flash[:info] = "投稿を更新して送信しました。"
      redirect_to root_url
    else  
      flash[:danger] = "投稿の更新に失敗しました。"
      redirect_to root_url
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @draft = Draft.find(params[:id])
  end

  private

    def draft_params
      params.require(:draft).permit(:name, :title, :period, :content, :target, :counter, :link, :emergency, :primary_sector, :other_sector, :emigration, :senior, :parenting, :other, :select)
    end
end
