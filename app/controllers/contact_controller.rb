class ContactController < ApplicationController
  def new
  	if params[:consultant_email]
  		@consultant_email = params[:consultant_email]
  	end
  end

  def send_email
  	if params[:message]
  	@message = params[:message]
  	end
  	if params[:email]
  	@consultant_email_address = params[:email]
    end
  ExampleMailer.send_email_to_consultant(@consultant_email_address, @message).deliver
  redirect_to posts_path, notice: "Email sent"
  end
end
