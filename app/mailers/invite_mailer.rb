class InviteMailer < ApplicationMailer
  def new_invite(invite, url)
    
    invite = @invite
    # url = new_user_registration_path(:invite_token => @invite.token)
    url = Invite.last

    mail to: "ovi.tsb77@gmail.com", 
    subject: "New comment for "
  end
end
