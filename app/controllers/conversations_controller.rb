class ConversationsController < ApplicationController
  
  before_action :check_current_user_is_signed_in
  # before_action :user_is_participant?, only: [:show]
 
  def show
    @conversation = Conversation.find(params[:id])
  end
  
  def retrieve_conversation
    @conversation = Conversation.find_or_create_by(user_id: params[:user_id], consultant_id: params[:consultant_id])
    redirect_to @conversation
  end
  
  private
  
  # def user_is_participant?
  #   if current_user.id != @conversation.user_id && current_user.id != @conversation.consultant_id
  #     redirect_to posts_path
  #   end
  # end
  
  def check_current_user_is_signed_in
      unless current_user_signed_in?
        redirect_to root_url, notice: "Please sign in to do that"
      end
    end

    def current_user_signed_in?
        current_user ? true : false
    end
end
