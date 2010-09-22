# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f7328d14a28cd5950c7ce769049597d0'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  helper_method :admin?

  def authorize
    unless admin?
      flash[:notice] = "Unauthorized access"
      redirect_to login_path
      false
    end
  end

  def admin?
    if session[:password] == 'xpto'
      true
    else
      false
    end
  end
end
TIPO = {'Curso' => 'Curso', 'Palestra' => 'Palestra', 'Teatro' => 'Teatro', 'Oficina' => 'Oficina', 'Outros' => 'Outros'}