class ApplicationController < ActionController::Base
  include Knock::Authenticable

  before_action :authenticate_user
end
