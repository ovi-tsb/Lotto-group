class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(game, user, group)
    
    @game = game
    current_user = user
    @group = group

    mail to: "ovi.tsb77@gmail.com", 
    subject: "New comment for "
  end
end
