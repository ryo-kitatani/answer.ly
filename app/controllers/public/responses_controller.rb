class Public::ResponsesController < ApplicationController
  before_action :authenticate_member!

  def create
    @answer = Answer.find(params[:answer_id])
    @response = current_member.responses.new(response_params)
    @response.answer_id = @answer.id
    @response.member_id = current_member.id
    if @response.save
      render :create
    end
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @response = Response.find_by(id: params[:id], answer_id: params[:answer_id])
    @response.destroy
    # redirect_to request.referer
    render :destroy
  end

  def edit
  end

  def update
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
