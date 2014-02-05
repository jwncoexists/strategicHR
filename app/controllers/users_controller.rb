class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:last_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    @account = params[:account]
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      RegistrationMailer.registration_confirmation(@user, 
        new_email_confirmation_url(token: @user.token)).deliver
      redirect_to login_path, notice: "A confirmation email has been sent!! Click link in the email to verify address, then log in below."
    else
      flash[:error] = "Error creating new user. Please try again."
      render :new
    end

  end

  # resend user confirmation email
  def reconfirm
     @user = User.find(params[:id])
     
    if @user
      # generate a new token
      @user.generate_token(:token)
      @user.save
      RegistrationMailer.registration_confirmation(@user, 
        new_email_confirmation_url(token: @user.token)).deliver
      redirect_to :back, notice: "A confirmation email has been re-sent! Please click link in email to verify your email address."
    else
      redirect_to :back, notice: "User not found!!"
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
     @user = User.find(params[:id])
     # @user = User.find(params[:id])
     # merge default value with params so if no collaborators checked, will erase
     if @user.update_attributes(params[:user])
       redirect_to @user
     else
       flash[:error] = "Error saving user.  Please try again."
       render :edit
     end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user, message: "You don't have acccess to delete this user."
    name = @user.name
    if @user.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to videos_path
    else
      flash[:error] = "There was an error deleting the user"
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, 
                                   :title, :company, :phone, :address1, :address2, :city, :state, :postal_code,
                                   :country, :confirmed_at, :account, :created_at, :updated_at, :token)
    end
end
