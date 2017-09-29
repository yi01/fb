class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end



def after_inactive_sign_up_path_for(resource)
new_user_session_path
end
end
