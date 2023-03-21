class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # secure by default
  before_action :authenticate_person!, unless: :devise_controller?

  helper_method :current_person

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    current_person
  end

  private

  def user_not_authorized(exception)
    flash[:alert] = "You are not authorized to perform this action."
  end
end
