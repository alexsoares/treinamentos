class LoginController < ApplicationController


def index
 render :action => 'login'
end

def login
end

def do_login
 username = params[:username]
 password = params[:password]
 if username.nil? || password.nil? || username==password
    redirect_to :action => "login"
    flash[:notice] = 'Usuário ou senha incorretos'
 else
    session["user_id"] = username
    redirect_to :controller => "secure", :action => "index"
end
end

end
