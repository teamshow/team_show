class WelcomeController < ApplicationController
  def _nav
  end
  def index
    @articles = Article.all
    @notices  = Notice.all
    @projects = Project.all
  end
end
