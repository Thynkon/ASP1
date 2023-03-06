class ApplicationController < ActionController::Base
  # secure by default
  before_action :authenticate_person!, unless: :devise_controller?
end
