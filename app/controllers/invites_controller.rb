class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  def index
    @invites = Invite.all.order("name ASC")
    @invite = Invite.all
  end
  def new
    @invite = Invite.new
  end
  def show
  end
  def create

     @invite = Invite.new(invite_params) # Make a new Invite
     @invite.sender_id = current_user.id # set the sender to the current user
    respond_to do |format| 
       if @invite.save
        # CommentMailer.new_comment(@group, current_user, @game).deliver_now
        InviteMailer.new_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
        # InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
         format.html { redirect_to invites_path, notice: 'Group was successfully created.' }
         format.json { render :index, status: :created, location: @invite }
       else
         format.html { render :new }
         format.json { render json: @invite.errors, status: :unprocessable_entity }
       end
   end

    # respond_to do |format|
      # if @invite.save
      #   # InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver #send the invite data to our mailer to deliver the email
      #   flash.now[:notice] = 'Message sent!'
      #   redirect_to invites_path
      # else
      #   # oh no, creating an new invitation failed
      #   # format.html { render :new }
      #   # format.json { render json: @invite.errors, status: :unprocessable_entity }
      #   flash.now[:alert] = 'Error while sending message!'
      # end
    # end
  end

  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invite_path, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def invite_params
      params.require(:invite).permit(:email, :group_id, :sender_id, :recipient_id, :token)
    end

    def set_invite
      @invite = Invite.find(params[:id])
    end



end
