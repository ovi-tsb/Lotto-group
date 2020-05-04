class InviteMailer < ApplicationMailer
  def new_invite(invite, user, group)
    
    invite = @invite
    # url = new_user_registration_path(:invite_token => @invite.token)
    # url = Invite.last
    user = User.last
    group = @group

    mail to: "ovi.tsb77@gmail.com", 
    subject: "New comment for "
  end
end
