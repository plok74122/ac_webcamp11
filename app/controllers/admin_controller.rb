class AdminController < ActionController::Base
  protect_from_forgery with: :exception

  def check_admin
    unless current_user.admin?
      raise
      redirect_to events_path
    end
  end
end
