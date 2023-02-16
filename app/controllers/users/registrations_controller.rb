class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    user_groups_path(current_user.id)
  end
end
