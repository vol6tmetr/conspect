class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user_admin, only: [:show, :destroy, :update, :edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.page params[:page]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @conspects = @user.conspects.all
    @search = @conspects.ransack(params[:q])
    @search.build_condition
    @conspects = @search.result.page(params[:page]).per(10)
  end

  # GET /users/new
  def new
    # @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :admin, :blocked, :name, :gender, :date_of_birth)
    end

    def user_admin
      unless current_user.try(:admin?) || current_user == @user
        flash[:notice] = 'Only admin can modify other user account'
        redirect_to root_path
      end
    end
end
