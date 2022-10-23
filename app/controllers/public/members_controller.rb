class Public::MembersController < ApplicationController


  def show
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

  private
  def update_params
    params.require(:member).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :address, :phone_number, :email)
  end


end
