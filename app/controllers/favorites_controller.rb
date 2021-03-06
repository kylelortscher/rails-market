class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    favorite_id_array = []
    @favorites.each do |favorite|
      favorite_id_array.push(favorite.service_id)
    end
    @services = Service.where(id: favorite_id_array)
  end


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
        redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
      end
    end
  end
end