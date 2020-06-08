class InviteMailer < ApplicationMailer
  def new_invite(invite, user, group)
    
    invite = @invite
    
    # url = Invite.last
    user = User.last
    group = @group
    url = new_user_registration_url(:invite_token => Invite.last.token)

    mail(:to => Invite.last.email, :subject => "New invitation ", from: 'notification@example.com')

    # mail to: "ovi.tsb77@gmail.com", 
    # subject: "New comment for "
  end
end
