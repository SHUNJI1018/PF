class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ログイン後の遷移先の設定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
        root_path
    when Customer
        root_path
    end
  end

  # ログアウト、退会した場合の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    #ユーザー用の新規登録情報用
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_kana_name, :first_kana_name, :email])
    # 管理者用のログイン画面と会員側のサインイン画面用
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
