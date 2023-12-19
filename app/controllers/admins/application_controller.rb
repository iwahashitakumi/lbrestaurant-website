class Admins::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  layout 'admins'

end
