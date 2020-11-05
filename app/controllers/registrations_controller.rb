class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:user).permit(:username, :first_name, :last_name, :profile_img_url, :email, :password, :password_confirmation, :current_password)
    end
        
    def account_update_params
        params.require(:user).permit(:username, :first_name, :last_name, :profile_img_url, :email, :password, :password_confirmation, :current_password)
    end

end
    