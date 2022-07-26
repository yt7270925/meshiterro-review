class ApplicationController < ActionController::Base
  #devise利用の機能（ログインなど）が使われる前にこのメソッドが実行される
  before_action :configue_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  #他のコントローラからも参照できる
  protected

    #ユーザー登録（sign_ip）の際に、nameの値を許可
    #ストロングパラメータと同様の機能
  def configue_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
