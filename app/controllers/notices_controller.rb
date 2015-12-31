class NoticesController < ApplicationController
  def new

  end
  def create
    redirect_to :notices

    @title = params[:notice][:title]
    @text  = params[:notice][:text]
    @admin_name = session[:un]
    # puts  @title, @text
    Notice.insert(@title, @text, @admin_name)

  end

  def index
    @notices = Notice.all
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @notice = Notice.find_by_id(id)
  end
end
