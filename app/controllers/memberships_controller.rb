class MembershipsController < ApplicationController


  def memberships__params
    params.require(:memberships_login).permit(:user, :password, :sel)
  end

  def login
    if session[:ut] == 'admin'
      redirect_to :new_article
    end
  end

  def signup

  end

  def signup_handle
    # handle post of member regist

    # Two passwords are not the same.
    if params[:signup][:password]!=params[:signup][:confirm]
      session[:err] = 1
      redirect_to :memberships_signup
    else
      session[:err] = 0
      # Insert the membership data into database.
      Member.insert(params[:signup][:user], params[:signup][:password], params[:signup][:phone],
      params[:signup][:qq], params[:signup][:is_leader])

      redirect_to :memberships_login
    end

  end

  # handle login
  def create

    @member_type = params[:sel]
    @name = params[:membership_login][:user]
    @passwd = params[:membership_login][:password]

    puts @member_type, Admin.check_membership(@name, @passwd)

    if Admin.check_membership(@name, @passwd) == 1 and @member_type == 'admin'
      # puts "Admin true."
      session[:ut] = 'admin'
      session[:un] = @name
      redirect_to :new_article
    end

  end

  def index

  end

end
