class AccountsController < ApplicationController
  before_action :set_account, only: [:show]
  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create 
    @account = current_user.accounts.new(account_params)
      if @account.save
        flash[:success] = "Account Created"
        redirect_to accounts_path
      else
        flash[:error] = "Error #{@account.errors.full_messages.join('\n')}"
        render :new
      end
  end

  private 
  def set_account
    @account = current_user.accounts.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :balance)
  end
end
