class SavedLinksController < ApplicationController
  
  # before_action :set_saved_link, only: [:update_rating]
  
  
  def update_link
  	@saved_link = ""
  	if SavedLink.find_by_link_url(params[:link_url].to_s)
  		@saved_link = SavedLink.find_by_link_url(params[:link_url].to_s)
  		@saved_link.click_count == nil ? @saved_link.click_count = 1 : @saved_link.click_count += 1
  		@saved_link.save
  	else 
  		@saved_link = SavedLink.create(title: params[:title].to_s, link_url: params[:link_url].to_s, click_count: 1)
  		@saved_link.save
  	end
  	redirect_to @saved_link.link_url.to_s
  end

  def index
  	@saved_links = SavedLink.all
  end
  
  def update_rating
    	@saved_link = ""
  	if SavedLink.find_by_link_url(params[:link_url].to_s)
  		@saved_link = SavedLink.find_by_link_url(params[:link_url].to_s)
  		@saved_link.ratings.build(rating: params[:rating].to_i)
      @saved_link.save
  	else 
  		@saved_link = SavedLink.create(title: params[:title].to_s, link_url: params[:link_url].to_s, click_count: 0)
  		@saved_link.ratings.build(rating: params[:rating].to_i)
  		@saved_link.save
  	end
  	redirect_to URI(request.referer).path
  end
  
  # private
  
  # def set_saved_link
    # @saved_link = SavedLink.find_or_create_by(link_url: params[:link_url])
  # end
  
  # def saved_link_params
      # params.require(:saved_link).permit(:link_url, :title, :click_count)
    # end
end
