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

  private

  def sign_up_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :cnpj, :phone, :trade, :state_identification, :area)
  end

  def account_update_params
    params.require(:company).permit(:name, :email, :password, :password_confirmation, :current_password, :cnpj, :phone, :trade, :state_identification, :area)
  end
end
