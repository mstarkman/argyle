class AppsController < ApplicationController
  respond_to :html, only: :index
  respond_to :js, only: [:new, :create]

  def index
    @apps = all_apps 
  end

  def new
    @app = App.new
  end

  def create
    @app = App.create app_params
    @apps = all_apps
  end

  private
  def all_apps
    App.all
  end

  def app_params
    params.require(:app).permit(:name, :description)
  end
end
