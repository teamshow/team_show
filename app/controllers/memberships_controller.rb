class MembershipsController < ApplicationController
  def memberships__params
    params.require(:membership_login).permit(:user, :password, :sel)
  end

  def login
  end

  def signup
  end

  def create
    redirect_to :new_article
    @member_type = params[:sel]
    @name = params[:membership_login][:user]
    @passwd = params[:membership_login][:password]

    puts @member_type, Admin.check_membership(@name, @passwd)

    if Admin.check_membership(@name, @passwd) == 1 and @member_type == 'admin'
      puts "Admin true."
      session[:ut] = 'admin'
      session[:un] = @name
    end

  end

  def index

  end

end
