# class RegistrationsController < Devise::RegistrationsController

#   def resource_name
#     :user
#   end

#   def new  
#     @user = User.new
#   end

#   # def create
#   #   @user = User.new(sign_up_params)
#   # end

#   private
#     def sign_up_params
#       params.require(:user).permit(:name, :email, :password, :password_confirmation)
#     end
# end

class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    if resource.save
      set_flash_message :notice, :signed_up if is_navigational_format?
      sign_in(resource_name, resource)

      respond_with resource, :location => redirect_location(resource_name, resource)
    else
      clean_up_passwords(resource)

      flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages

      redirect_to new_company_registration_path
    end
  end

  private

  def sign_up_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :cnpj, :phone, :trade, :state_identification, :area)
  end

  def account_update_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :current_password, :cnpj, :phone, :trade, :state_identification, :area)
  end
end
