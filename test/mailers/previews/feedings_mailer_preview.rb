# Preview all emails at http://localhost:3000/rails/mailers/feedings_mailer
class FeedingsMailerPreview < ActionMailer::Preview


  def notification_mail_preview
    FeedingsMailer.notification_email(User.first, Feeding.last)
  end

end
