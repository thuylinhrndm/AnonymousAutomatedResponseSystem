class ChatmessagesController < ApplicationController
	#before_filter :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @chatmessage = @conversation.chatmessages.build(chatmessage_params)
    @chatmessage.user_id = current_user.id
    @chatmessage.save!

    @path = conversation_path(@conversation)
  end

  private

  def chatmessage_params
    params.require(:chatmessage).permit(:body)
  end
end
