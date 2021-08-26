class DraftsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @drafts = current_user.admin? ? Draft.all : Draft.where(user_id: @user.id)
  end

  def new
    @user = User.find(params[:id])
    @draft = Draft.new
  end

  def create
    @user = User.find(params[:id])
    @draft = Draft.new(draft_params)
    if @draft.save
      flash[:success] = '投稿を送信しました。'
      redirect_to drafts_url(current_user.id)
    else
      flash.now[:danger] = '投稿の送信ができませんでした。'
      render :new
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "無効な入力データがあった為、更新処理をキャンセルしました。"
    redirect_to drafts_url(current_user.id)
  end

  def edit
  end

  def destroy

  end

  private

    def draft_params
      params.require(:draft).permit(:name, :title, :period, :content, :target, :counter, :link, :emergency, :primary_sector, :other_sector, :emigration, :senior, :parenting, :other, :select, :comment, :draft_approver_id, :draft_status)
    end
end
