class AppSentinalsController < ApplicationController
  respond_to :js

  def index
    @app = App.find(params[:app_id])
    @sentinals = Sentinal.all.order("upper(name)")
  end

  def create
    @app = App.find(params[:app_id])
    sentinal_id = nil
    params.each_key do |key|
      if key =~ /^sentinal/
        sentinal_id = key.split("_").last.to_i
      end
    end
    @sentinal = Sentinal.find(sentinal_id)
    @app.sentinals << @sentinal
  end

  def destroy
    AppSentinal.find(params[:id]).destroy
  end
end
