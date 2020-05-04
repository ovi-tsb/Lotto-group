# Preview all emails at http://localhost:3000/rails/mailers/invite
class InvitePreview < ActionMailer::Preview
  def new_invite
    # comment = Comment.last
    invite = @invite
    url = Invite.last
    user = @user


    InviteMailer.new_invite(invite, url, user)
    
    # job = Job.last
    # InvoiceMailer.invoice_mail(invoice, user, job) 
  end

end
