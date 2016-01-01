class ProjectsController < ApplicationController
  def new
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end
  end
  def create
    redirect_to :projects

    @title = params[:project][:title]
    @text  = params[:project][:text]
    # puts  @title, @text
    Project.insert(@title, @text)

  end

  def index
    @projects = Project.all.reverse_order
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @project = Project.find_by_id(id)
  end
  def modify
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @projects = Project.all
    # delete a project
    if params[:del]
      @del_id = params[:del]
      Project.delete(@del_id)
    end
    # edit a project
    if params[:edt]
      @edt_id = params[:edt]
      # redirect_to
    end
  end

  # get project edit page
  def edt
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @edt_id = params[:edt]
    session[:edt_id] = @edt_id
    @project = Project.find(@edt_id)

  end

  def edt_handle
    # handle project edit post request
    if params[:projects_edt][:title]
      Project.update(session[:edt_id], :name=>params[:projects_edt][:title],
                    :description => params[:projects_edt][:description])

      redirect_to projects_modify_path
    end
  end
  def del
    @projects.all
  end

end
