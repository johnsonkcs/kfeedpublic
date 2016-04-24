class RegistrationsController < Devise::RegistrationsController

  private

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
  	byebug
  	'/users/edit'
  end

end