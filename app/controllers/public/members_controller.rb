class Public::MembersController < ApplicationController


  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if
      @member.update(update_params)
      flash[:notice] = "successfully updated!"
      redirect_to members_my_page_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    @member = current_member
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def update_params
    params.require(:member).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :address, :phone_number, :email)
  end


end
