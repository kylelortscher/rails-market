class ServicesController < ApplicationController

  def index
    @title = "Sellgrip Marketplace - eCommerce Service Marketplace"
    @services = Service.all
  end

  def show
    @title = params[:titleSeo]
    @service = Service.where(titleSeo: params[:titleSeo])
  end

  def new
    @title = "Sellgrip - New Service"
    @service = Service.new
  end

  def edit
    @test = Test.find(params[:id])
    @title = "Sellgrip Edit Service"
  end

  def create
    @service = Service.new
    @service.title = params[:title]
    #Creating A Slug For Service Title
    @service.title_seo = @service.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    @service.price = params[:price]
    @service.due_date = params[:date]
    @service.youtube_url = params[:youtubeUrl]
    @service.category = params[:category]
    @service.sub_category = params[:sub_category]
    @service.description = params[:description]
    @service.due_date = params[:due_date]
    @service.refund = params[:refund]
    @service.status = true
    @service.user_id = current_user.id
    if @service.save
      flash[:notice] = "Service Successfully Created"
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "Successfully Updated Service"
      redirect_to '/'
    else
      render :edit
    end
  end


  private

  def service_params
    params.require(:test).permit(:title, :price, :due_date, :youtube_url, :category, :sub_category, :description, :refund)
  end

end