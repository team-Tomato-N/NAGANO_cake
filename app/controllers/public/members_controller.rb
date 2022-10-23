class Public::MembersController < ApplicationController

  def my_page
    @member = Member.find(params[:id])
  end

  def show
  end

  def edit
  end

  def confirm
  end
end
