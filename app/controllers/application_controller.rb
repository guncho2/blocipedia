class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: :root_path



end
