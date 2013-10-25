class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :is_admin?

  protected

    def require_owner
      object = instance_variable_get("@#{self.controller_name.singularize}")
      logger.info "@#{self.controller_name.singularize}"
      unless current_user && object.is_owned_by?(current_user)
        flash[:alert] = "You do not have access to that resource."
        redirect_to root_url
      end
    end

    def authorize_signed_in
      unless user_signed_in?
        flash[:alert] = "You must be logged in."
        redirect_to new_user_session_path
      end
    end

    def is_admin?
      if current_user && current_user.admin
        true
      else
        false
      end
    end

    def require_admin
      unless is_admin?
        flash[:alert] = "You must be an admin to access this resource."
        redirect_to root_path
      end
    end
end
