class Admin::EventsController < AdminController
  before_action :authenticate_user!
  before_action :check_admin

  def index
  end
  
end
