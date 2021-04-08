class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "変更内容を保存しました。"
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def connections
  end

  def guest_sign_in
    member = Member.find_or_create_by!(email:"guest@gmail.com") do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "ゲストユーザー"
    end
    sign_in member
    redirect_to root_path, noite: "ゲストユーザーとしてログインしました。"
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :image, :introduction, :country_code, :experienced_coutnry)
  end

end