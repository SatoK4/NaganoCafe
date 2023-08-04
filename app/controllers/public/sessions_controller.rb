# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  # 退会しているかを判断するメソッド
  def customer_state
    # 入力されたemailからアカウントを取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # 取得できなかったらメソッドを終了
    return if !@customer
    # 取得した垢のパスワードが入力と一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      if @customer.is_deleted == true
        redirect_to new_customer_registration_path
      end
    end
  end
end
