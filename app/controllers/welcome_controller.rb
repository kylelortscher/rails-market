class WelcomeController < ApplicationController
  def index
    @title = "Sellgrip Marketplace"
    @services = Service.all
  end
end
