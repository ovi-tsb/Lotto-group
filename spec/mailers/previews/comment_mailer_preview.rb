# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/new_comment
  def new_comment
    # comment = Comment.last
    user = User.last
    game = Game.last
    group = Group.last


    CommentMailer.new_comment(user, game, group)
    # user = User.last
    # job = Job.last
    # InvoiceMailer.invoice_mail(invoice, user, job) 
  end

end
