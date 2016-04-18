module ApplicationHelper

	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def active_tab?(path)
    	request.original_url.split('/').last.to_s == path.split('/').last.to_s ? true : false
    end

    def list_class(path)
    	active_tab?(path) ? "active" : ""
    end
end
