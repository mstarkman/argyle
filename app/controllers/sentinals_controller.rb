class SentinalsController < ApplicationController
  respond_to :html, only: :index
  respond_to :js, only: [:new, :create, :destroy]
  
  def index
    @sentinals = Sentinal.all
  end

  def new
    @sentinal = Sentinal.new
  end
end
