class BaseCartController < ApplicationController
  before_action :require_user
	
  def require_user
    render file: "/public/404" if current_admin?
  end
end
