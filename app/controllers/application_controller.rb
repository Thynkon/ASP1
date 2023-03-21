class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # secure by default
  before_action :authenticate_person!, unless: :devise_controller?

  helper_method :current_person

  def current_user
    current_person
  end
end
