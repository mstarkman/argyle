class SentinalsController < ApplicationController
  respond_to :html, only: :index
  respond_to :js, only: [:new, :create, :destroy, :change_form]
  
  def index
    @sentinals = all_sentinals
  end

  def new
    sentinal_type = Sentinal.sentinal_list.first.class_name.constantize
    @sentinal = sentinal_type.new
  end

  def create
    value = params[:sentinal_type_value]
    sentinal_type = Sentinal.sentinal_struct_from_value(value).class_name.constantize
    @sentinal = sentinal_type.create sentinal_params
    @sentinals = all_sentinals
  end

  def destroy
    @sentinal = Sentinal.find(params[:id])
    @sentinal.destroy
    @sentinals = all_sentinals
  end  

  def change_form
    value = params[:sentinal_type]
    sentinal_type = Sentinal.sentinal_struct_from_value(value).class_name.constantize
    @sentinal = sentinal_type.new
  end

  private
  def all_sentinals
    Sentinal.all.order("upper(name)")
  end

  def sentinal_params
    sentinal_struct = Sentinal.sentinal_struct_from_value(params[:sentinal_type_value])

    case params[:sentinal_type_value].to_i
    when 0 then params.require("MongodbReadOnlySentinal".underscore.to_sym).permit(:name, :description, :host, :port, :database, :collection, :document_count)
    when 1 then params.require("MongodbReadWriteSentinal".underscore.to_sym).permit(:name, :description)
    when 2 then params.require("S3ReadOnlySentinal".underscore.to_sym).permit(:name, :description)
    when 3 then params.require("S3ReadWriteSentinal".underscore.to_sym).permit(:name, :description)
    end
  end
end
