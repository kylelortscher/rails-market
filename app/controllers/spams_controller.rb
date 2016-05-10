class SpamsController < ApplicationController
  before_action :authenticate_user!
  def create
    @service = Service.find_by id: params[:service_id]
    @spam = Spam.new
    @spam.user_id = current_user.id
    @spam.service_id = params[:service_id]

    if Spam.exists?(user_id: @spam.user_id, service_id: @spam.service_id)
      flash[:alert] = "You have already reported this service we are looking into it!"
      redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
    else
      if @spam.save
        flash[:notice] = "Reported this service as spam"
        redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
      else
        redirect_to '/services/' + @service.algolia_id + '/' + @service.title_seo
      end
    end
  end
end