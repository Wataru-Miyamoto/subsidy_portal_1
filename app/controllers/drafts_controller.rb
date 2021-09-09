class DraftsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @drafts = current_user.admin? ? Draft.all : Draft.where(user_id: @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @draft = Draft.new
  end

  def create
    @user = User.find(params[:user_id])
    @draft = Draft.new(draft_params)
    if @draft.save
      flash[:success] = '投稿を送信しました。'
      redirect_to drafts_url(current_user.id)
    else
      flash.now[:danger] = '投稿の送信ができませんでした。'
      render :new
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @user = User.find(params[:user_id])
    @draft = Draft.find(params[:id])
  end

  private

    def draft_params
      params.require(:user).permit(drafts: [:name, :title, :period, :content, :target, :counter, :link, :emergency, :primary_sector, :other_sector, :emigration, :senior, :parenting, :other, :select, :comment, :draft_approver_id, :draft_status])[:drafts]
    end
end
