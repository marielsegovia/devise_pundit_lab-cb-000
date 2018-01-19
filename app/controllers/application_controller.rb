class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private #won't allow a user to see another user's profile
    def user_not_authorized(error)
      flash[:error] = "Access denied."
      redirect_to root_path
    end
end
