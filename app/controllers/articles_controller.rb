class ArticlesController < ApplicationController
  def new
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end
  end
  def create
    redirect_to :articles

    @title = params[:article][:title]
    @text  = params[:article][:text]
    @admin_name = session[:un]
    # puts  @title, @text
    Article.insert(@title, @text, @admin_name)

  end

  def index
    @articles = Article.all.reverse_order
  end

  def show
    id = params[:id].to_i
    # puts id
    if id == 1
      puts '11'
    end
    @article = Article.find_by_id(id)
  end

  def modify
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @articles = Article.all
    # delete an article
    if params[:del]
      @del_id = params[:del]
      Article.delete(@del_id)
    end
    # edit an article
    if params[:edt]
      @edt_id = params[:edt]
      # redirect_to
    end
  end

  # get article edit page
  def edt
    if session[:ut] != 'admin'
      redirect_to welcome_error_path
    end

    @edt_id = params[:edt]
    session[:edt_id] = @edt_id
    @article = Article.find(@edt_id)

  end

  def edt_handle
    # handle article edit post request
    if params[:articles_edt][:title]
      Article.update(session[:edt_id], :title=>params[:articles_edt][:title],
      :content => params[:articles_edt][:text])

      redirect_to articles_modify_path
    end
  end
end
