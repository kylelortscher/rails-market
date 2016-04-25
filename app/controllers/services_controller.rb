class ServicesController < ApplicationController

  def index
    @title = "Sellgrip Marketplace - eCommerce Service Marketplace"
    @services = Service.all
  end

  def show
    @service = Service.where(titleSeo: params[:titleSeo])
  end

  def new
    @service = Service.new
  end

  def edit
    @test = Test.find(params[:id])
  end

  def create
    @service = Service.new(service_params)
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