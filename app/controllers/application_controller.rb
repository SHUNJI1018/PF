class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #ユーザー用の新規登録情報用
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_kana_name, :first_kana_name, :email])
    # 管理者用のログイン画面と会員側のサインイン画面用
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
