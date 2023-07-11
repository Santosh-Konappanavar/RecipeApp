class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update
    # Add :bio to the permitted parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password])
  end
end
