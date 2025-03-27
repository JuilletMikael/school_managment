class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_person!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def authorize_admin
    unless current_person.has_role?(:dean)
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def authorize_teacher
    unless current_person.has_role?(:dean) || current_person.has_role?(:teacher)
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def authorize_student
    unless current_person.has_role?(:dean) || current_person.has_role?(:teacher) || current_person.has_role?(:student)
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  helper_method :current_user_role
  def current_user_role
    if current_person.has_role?(:dean)
      :dean
    elsif current_person.has_role?(:teacher)
      :teacher
    elsif current_person.has_role?(:student)
      :student
    end
  end
end
