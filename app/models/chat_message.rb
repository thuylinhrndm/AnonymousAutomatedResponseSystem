class ChatMessage < ActiveRecord::Base
  # associations
  belongs_to :conversation
  belongs_to :user
  
  #life cycle hook
  after_create_commit { ChatMessageBroadcastJob.perform_later self }
end
