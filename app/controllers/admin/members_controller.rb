class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
  @member = Member.find(params[:id])
    if
      @member.update(update_params)
      flash[:notice] = "successfully updated!"
      redirect_to members_my_page_path
    else
      render :edit
    end
  end

  private
  def update_params
    params.require(:member).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end


end
