class EmailsController < ApplicationController
    
    def reminder
        Reminder.reminder_email(params[:user_id], params[:time], params[:consultant_id]).deliver
        redirect_to root_path, notice: "Thank you for sending that email"
    end
end
