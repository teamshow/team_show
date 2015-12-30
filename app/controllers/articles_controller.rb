class ArticlesController < ApplicationController
  def new

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
    @articles = Article.all
  end

  def show
    id = params[:id]
    @article = Article.find_by_article_id(id)
    redirect_to
  end

end
