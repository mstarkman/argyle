class StatusController < ApplicationController
  def index
    @apps = App.all.order("upper(name)").includes(:sentinals)
  end
end
