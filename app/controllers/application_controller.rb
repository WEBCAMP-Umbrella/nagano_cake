class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  $postage = '800'
  $cart_number = [*1..30]
  $tax = 1.1



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :family_name, :first_name_kana, :family_name_kana, :phone_number, :is_cancel,:address,:postal_code])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :family_name, :first_name_kana, :family_name_kana, :phone_number, :is_cancel,:address,:postal_code])
    end

end
