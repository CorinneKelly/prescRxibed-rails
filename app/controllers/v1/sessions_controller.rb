class V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    
    account = Account.authenticate(account_params[:googleId])
    if account
      account.update(googleToken: account_params[:googleToken])
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token, fullname: account.name}
    elsif account = Account.create(account_params)

      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token, fullname: account.name}
    else
      render json: {error: "Bad username or password"}, status: 401
    end
  end

  def destroy
  end

  private
  def account_params
    params.require(:account).permit(:googleToken, :googleId, :name)
  end
end
