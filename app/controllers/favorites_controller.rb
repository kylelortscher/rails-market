class FavoritesController < ApplicationController
  def create
    @service = Service.find_by id: params[:service_id]
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.service_id = params[:service_id]

    if Favorite.exists?(user_id: @favorite.user_id, service_id: @favorite.service_id)
      flash[:alert] = "Already In Your Favorites!"
      redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
    else
      if @favorite.save
        flash[:notice] = "Added To Your Favorites"
        redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
      else
        render :new
      end
    end
  end
end