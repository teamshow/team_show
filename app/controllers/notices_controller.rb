class NoticesController < ApplicationController
  def new

  end
  def create
    render plain: params[:product][:category_id].inspect
    render plain: params[:notices].inspect
  end
end
