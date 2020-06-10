class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    # @user = current_user
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    @token = params[:invite_token]
    respond_to do |format|
      if @token != nil
          org = Invite.find_by_token(@token).group #find the user group attached to the invite
          @user.group.push(org) #add this user to the new user group as a member
        if @user.save
          format.html { redirect_to @group, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end

      else
        # do normal registration things #
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @token = params[:invite_token] #<-- pulls the value from the url query string
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end


  def send_contact
    from = params[:contact][:from]
    subject = params[:contact][:subject]
    message = params[:contact][:message]
    ContactMailer.send_contact(from,subject,message).deliver_now

    redirect_to root_url, notice: "Your message has been sent!"
  end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :title, :dob)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
