class ProjectsController < ApplicationController
  def new

  end
  def create
    redirect_to :projects

    @title = params[:project][:title]
    @text  = params[:project][:text]
    # puts  @title, @text
    Project.insert(@title, @text)

  end

  def index
    @projects = Project.all
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @project = Project.find_by_id(id)
  end

end
