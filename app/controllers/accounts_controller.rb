class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @accounts = Account.all
    @users = User.all
  end


  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end


  def create
    @account = current_user.account = Account.new(account_params)
      if @account.save
         redirect_to @account, notice: 'Account was successfully created.'
      else
      render :new 
      end
  end


  def update
      if @account.update(account_params)
        redirect_to @account, notice: 'Account was successfully updated.' 
      else
        render :edit
      end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:account_number, :first_name, :last_name, :mobile, :address, :postcode, :suburb, :social_media, :business_name, :abn, :phone, :website, :user_id)
    end
end
