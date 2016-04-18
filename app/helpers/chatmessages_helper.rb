module ChatmessagesHelper
	
	def self_or_other(chatmessage)
    	chatmessage.user == current_user ? "self" : "other"
  	end

  	def chatmessage_interlocutor(chatmessage)
    	chatmessage.user == chatmessage.conversation.sender ? chatmessage.conversation.sender : chatmessage.conversation.recipient
  	end
end
