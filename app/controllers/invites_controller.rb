class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  def create
     @invite = Invite.new(invite_params) # Make a new Invite
     @invite.sender_id = current_user.id # set the sender to the current user
     
    # respond_to do |format|
      if @invite.save
        InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver #send the invite data to our mailer to deliver the email
      else
        # oh no, creating an new invitation failed
        # format.html { render :new }
        # format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    # end
  end

  private
    def invite_params
      params.require(:invite).permit(:emails, :group_id, :sender_id, :recipient_id, :token)
    end

    def set_invite
      @invite = Invite.find(params[:id])
    end



end
